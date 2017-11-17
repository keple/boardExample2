package org.exBoard.web;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.exBoard.domain.BoardVO;
import org.exBoard.domain.Criteria;
import org.exBoard.domain.FileDTO;
import org.exBoard.domain.FileVO;
import org.exBoard.domain.Pager;
import org.exBoard.domain.ReplyVO;
import org.exBoard.service.ExBoardService;
import org.exBoard.util.FileUtil;
import org.exBoard.util.FileWrapper;
import org.exBoard.util.MediaUtil;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/board")
public class BoardController {
	Logger logger = Logger.getLogger(BoardController.class);
	private static final String uploadPath = "D:\\zzz\\";
	//private static final String path = "C:\\zzz\\temp";
	
	@Inject
	ExBoardService boardService;
	
	@GetMapping("/list")
	public void getBoardList(Criteria cri,Model model){
		
			String[] typeArr = new String[cri.getType().length()];
			
			if (cri.getKeyword().equals("x")) {
				cri.setKeyword(null);
			}
			
			for (int i = 0; i < cri.getType().length(); i++) {
				typeArr[i] = cri.getType().substring(i, i + 1);
			}
			cri.setTypes(typeArr);

		
		
		model.addAttribute("boardList", boardService.getBoardList(cri));
		
		
		model.addAttribute("criteria",cri);
		
		
	}
	@GetMapping("/register")
	public void goRegistpage(){
		
	}
	@PostMapping(value = "/register", produces="application/text;charset=utf8")
	@ResponseBody
	public String getRegistForm(BoardVO vo,FileDTO dto){
		logger.info(vo);
		logger.info(dto);
		return boardService.insertBoard(vo,dto);
		
	}
	
	
	@GetMapping("/pager/{pageNum}/{size}")
	@ResponseBody
	public Pager getListPage(Criteria cri){
		int total = boardService.getTotal();
		
		Pager pager = new Pager(cri,total);
		logger.info(pager);
		
		
		return pager;
	}
	
	
	@GetMapping("/read")
	public void toRead(@RequestParam("bno") Integer bno,Criteria cri,Integer page,Model model){
		
		logger.info("리드페이지 크리테리아"+cri);
		
		 model.addAttribute("board",boardService.getBoard(bno));
		 model.addAttribute("option",bno);
		 model.addAttribute("cri", cri);
		 
		 
	}
	@GetMapping("/fileList/{bno}")
	@ResponseBody
	public List<FileVO> getFileList(@PathVariable("bno") Integer bno){
		Criteria cri = new Criteria();
		cri.setOption(bno);
		logger.info(cri);
		return boardService.getFileList(cri);
	}
	
	@GetMapping("/replies/{pageNum}/{size}/{bno}")
	@ResponseBody
	public List<ReplyVO> getReplyList(Criteria cri,@PathVariable("bno") Integer bno){
		
		cri.setOption(bno);
		return boardService.getReplyList(cri);
	}
	@DeleteMapping(value = "/delete/{bno}", produces="application/text;charset=utf8")
	@ResponseBody
	public String deleteBoard(BoardVO vo){
		logger.info("delete in /"+vo);
		return boardService.deleteBoard(vo.getBno());
	}
	@PostMapping(value="/registReply", produces="application/text;charset=utf8")
	@ResponseBody
	public String registReply(ReplyVO rvo){
		logger.info(rvo);
		
		return boardService.insertReply(rvo);
	}
	@GetMapping("/update")
	public void toUpdate(@RequestParam("bno") Integer bno, Model model){
		
		model.addAttribute("board",boardService.getBoard(bno));
		model.addAttribute("option", bno);
		
	}
	@PostMapping("/update")
	@ResponseBody
	public String updateBoard(BoardVO vo){
		
		
		
		return boardService.updateBoard(vo);
	}
	@PostMapping(value = "/fileUpload")
	@ResponseBody
	public ResponseEntity<List<FileWrapper>> fileUpload(@RequestParam("files[]")MultipartFile[] file){
		
		List<FileWrapper> fileNames = new ArrayList();
		logger.info(file.toString());
		String tempPath = FileUtil.calcPath(uploadPath);
		logger.info("what is path"+tempPath);
		try{
			for(int i=0;i<file.length;i++){
				if(file[i].getSize()!=0){
					
					logger.info(file[i].getOriginalFilename());
					fileNames.add(new FileWrapper(FileUtil.uploadFile(uploadPath, file[i].getOriginalFilename(), file[i].getBytes()),file[i].getOriginalFilename()));
					
				}
				
			}
		}catch(Exception e){
			
		}
		
		
		return new ResponseEntity<>(fileNames,HttpStatus.OK);
		
	}
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String fileName) throws IOException{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		logger.info("fnameS"+fileName);
		
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtil.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);
			if(mType !=null){
				headers.setContentType(mType);
			}else{
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition","attachment; fileName = \""+new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
				
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
	}
	@GetMapping("/display/oct")
	public ResponseEntity<byte[]> displayOct(String fileName)throws Exception{
		InputStream in = null;
		ResponseEntity<byte[]> entity =null;
		
		logger.info("FileName : " + fileName);
		
		try{
			
			//String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath + fileName);
			
			fileName = fileName.substring(fileName.indexOf("_")+1);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition","attachment; fileName = \""+new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.OK);
	}catch(Exception e){
		e.printStackTrace();
		entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	}finally{
		in.close();
	}
	return entity;
	}
	
}
