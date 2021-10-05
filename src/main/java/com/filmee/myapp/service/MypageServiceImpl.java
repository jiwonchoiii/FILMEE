package com.filmee.myapp.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.filmee.myapp.domain.ActivityVO;
import com.filmee.myapp.domain.CriteriaActivity;
import com.filmee.myapp.domain.CriteriaFilm;
import com.filmee.myapp.domain.CriteriaFollow;
import com.filmee.myapp.domain.CriteriaGuestbook;
import com.filmee.myapp.domain.CriteriaMain;
import com.filmee.myapp.domain.CriteriaReview;
import com.filmee.myapp.domain.FilmReactionVO;
import com.filmee.myapp.domain.FolloweeVO;
import com.filmee.myapp.domain.FollowerVO;
import com.filmee.myapp.domain.GuestbookVO;
import com.filmee.myapp.domain.LikedReviewVO;
import com.filmee.myapp.domain.MainFilmVO;
import com.filmee.myapp.domain.MainGuestbookVO;
import com.filmee.myapp.domain.MainReviewVO;
import com.filmee.myapp.domain.MainUserVO;
import com.filmee.myapp.domain.MypageReviewVO;
import com.filmee.myapp.mapper.MypageMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class MypageServiceImpl 
	implements MypageService {
	
	@Autowired
	private MypageMapper mapper;
	
	
	@Override
	public MainUserVO getMainUser(CriteriaMain cri) {
		log.debug("getMainUser({}) invoked.", cri);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getMainUser(cri);
	} //getMainUser
	
	@Override
	public int getTotalCountMainFollowers(CriteriaMain cri) {
		log.debug("getTotalCountMainFollowers({}) invoked.", cri);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getTotalCountMainFollowers(cri);
	} //getTotalCountMainFollowers

	@Override
	public int getTotalCountMainFollowees(CriteriaMain cri) {
		log.debug("getTotalCountMainFollowees({}) invoked.", cri);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getTotalCountMainFollowees(cri);
	} //getTotalCountMainFollowees

	@Override
	public int getTotalCountMainFilms(CriteriaMain cri) {
		log.debug("getTotalCountMainFilms({}) invoked.", cri);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getTotalCountMainFilms(cri);
	} //getTotalCountMainFilms

	@Override
	public int getTotalCountMainReviews(CriteriaMain cri) {
		log.debug("getTotalCountMainReviews({}) invoked.", cri);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getTotalCountMainReviews(cri);
	} //getTotalCountMainReviews

	@Override
	public List<MainFilmVO> getMainFilm(CriteriaMain cri) {
		log.debug("getMainFilm({}) invoked.", cri);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getMainFilm(cri);
	} //getMainFilm

	@Override
	public List<MainReviewVO> getMainReview(CriteriaMain cri) {
		log.debug("getMainReview({}) invoked.", cri);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getMainReview(cri);
	} //getMainReview

	@Override
	public List<MainGuestbookVO> getMainGuestbook(CriteriaMain cri) {
		log.debug("getMainGuestbook({}) invoked.", cri);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getMainGuestbook(cri);
	} //getMainGuestbook

	@Override
	public List<ActivityVO> getMainActivity(CriteriaMain cri) {
		log.debug("getMainActivity({}) invoked.", cri);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getMainActivity(cri);
	} //getMainActivity

	@Override
	public List<FilmReactionVO> getFilmReactionList(CriteriaFilm criFilm) {
		log.debug("getFilmReactionList({}) invoked.", criFilm);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getFilmReactionList(criFilm);		
	} //getFilmReactionList

	@Override
	public List<FollowerVO> getFollowerList(CriteriaFollow criF) {
		log.debug("getFollowerList({}) invoked.", criF);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getFollowerList(criF);		
	} //getFollowerList
	
	@Override
	public List<FolloweeVO> getFolloweeList(CriteriaFollow criF) {
		log.debug("getFolloweeList({}) invoked.", criF);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getFolloweeList(criF);		
	} //getFolloweeList

	@Override
	public List<GuestbookVO> getGuestbookList(CriteriaGuestbook criG) {
		log.debug("getGuestbookList({}) invoked.", criG);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getGuestbookList(criG);
		
	} //getGuestbookList

	@Override
	public List<MypageReviewVO> getMyReviewList(CriteriaReview criR) {
		log.debug("getMyReviewList({}) invoked.", criR);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getMyReviewList(criR);		
	} //getMyReviewList
	
	@Override
	public List<LikedReviewVO> getLikedReviewList(CriteriaReview criR) {
		log.debug("getLikedReviewList({}) invoked.", criR);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getLikedReviewList(criR);		
	} //getLikedReviewList
	
	@Override
	public List<ActivityVO> getActivityList(CriteriaActivity criA) {
		log.debug("getActivityList({}) invoked.", criA);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getActivityList(criA);		
	} //getActivityList

	@Override
	public int getTotalCountReactions(CriteriaFilm criFilm) {
		log.debug("getTotalCountReactions({}) invoked.", criFilm);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getTotalCountReactions(criFilm);
	} //getTotalCountReactions

	@Override
	public int getTotalCountFollowers(CriteriaFollow criF) {
		log.debug("getTotalCountFollowers({}) invoked.", criF);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getTotalCountFollowers(criF);
	} //getTotalCountFollowers

	@Override
	public int getTotalCountFollowees(CriteriaFollow criF) {
		log.debug("getTotalCountFollowees({}) invoked.", criF);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getTotalCountFollowees(criF);
	} //getTotalCountFollowees

	@Override
	public int getTotalCountGuestbooks(CriteriaGuestbook criG) {
		log.debug("getTotalCountGuestbooks({}) invoked.", criG);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getTotalCountGuestbooks(criG);
	} //getTotalCountGuestbooks

	@Override
	public int getTotalCountMyReviews(CriteriaReview criR) {
		log.debug("getTotalCountMyReviews({}) invoked.", criR);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getTotalCountMyReviews(criR);
	} //getTotalCountMyReviews
	
	@Override
	public int getTotalCountLikedReviews(CriteriaReview criR) {
		log.debug("getTotalCountLikedReviews({}) invoked.", criR);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getTotalCountLikedReviews(criR);
	} //getTotalCountLikedReviews
	
	@Override
	public int getTotalCountActivity(CriteriaActivity criA) {
		log.debug("getTotalCountActivity({}) invoked.", criA);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getTotalCountActivity(criA);
	} //getTotalCountActivity

	@Override
	public boolean deleteMainReview(Integer rno) {
		log.debug("deleteMainReview({}) invoked.", rno);
		
		Objects.requireNonNull(this.mapper);
		
		return (this.mapper.deleteMainReview(rno) == 1);
	} //deleteMainReview
	
	@Override
	public boolean deleteMainGuestbook(Integer gno) {
		log.debug("deleteMainReview({}) invoked.", gno);
		
		Objects.requireNonNull(this.mapper);
		
		return (this.mapper.deleteMainGuestbook(gno) == 1);
	} //deleteMainGuestbook
	
	@Override
	public boolean insertGuestbook(MainGuestbookVO guestbook) {
		log.debug("insertGuestbook({}) invoked.", guestbook);
		
		Objects.requireNonNull(this.mapper);
		
		return (this.mapper.insertGuestbook(guestbook) == 1);
	} //insertGuestbook
	
	@Override
	public boolean deleteFilmReaction(Integer userid, Integer filmid, Integer code) {
		log.debug("deleteFilmReaction({}, {}, {}) invoked.", userid, filmid, code);
		
		Objects.requireNonNull(this.mapper);
		
		return (this.mapper.deleteFilmReaction(userid, filmid, code) == 1);
	} //deleteFilmReaction
	
	@Override
	public boolean cancelFollower(Integer follower, Integer followee) {
		log.debug("cancelFollower({}, {}) invoked.", follower, followee);
		
		Objects.requireNonNull(this.mapper);
		
		return (this.mapper.cancelFollower(follower, followee) == 1);
	} //cancelFollower
	
	@Override
	public boolean deleteGuestbook(Integer gno) {
		log.debug("deleteGuestbook({}) invoked.", gno);
		
		Objects.requireNonNull(this.mapper);
		
		return (this.mapper.deleteGuestbook(gno) == 1);
	} //deleteGuestbook
	
	@Override
	public boolean deleteMyReview(Integer rno) {
		log.debug("deleteMyReview({}) invoked.", rno);
		
		Objects.requireNonNull(this.mapper);
		
		return (this.mapper.deleteMyReview(rno) == 1);
	} //deleteMyReview
	
	@Override
	public boolean cancelLikedReview(Integer rno, Integer userid) {
		log.debug("cancelLikedReview({}) invoked.", rno, userid);
		
		Objects.requireNonNull(this.mapper);
		
		return (this.mapper.cancelLikedReview(rno, userid) == 1);
	} //cancelLikedReview

	@Override
	public boolean insertFollow(Integer follower, Integer followee) {
		log.debug("insertFollow({}, {}) invoked.", follower, followee);
		
		Objects.requireNonNull(this.mapper);
		
		return (this.mapper.insertFollow(follower, followee) == 1);
	} //insertFollow

	@Override
	public boolean deleteFollow(Integer follower, Integer followee) {
		log.debug("deleteFollow({}, {}) invoked.", follower, followee);
		
		Objects.requireNonNull(this.mapper);
		
		return (this.mapper.deleteFollow(follower, followee) == 1);
	} //deleteFollow

	@Override
	public int isFollowed(Integer follower, Integer followee) {
		log.debug("isFollowed({}, {}) invoked.", follower, followee);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.isFollowed(follower, followee);
	} //isFollowed
	
	@Override
	public boolean updateUserProfilePhoto(MultipartFile file, String profileText, String nickname, CriteriaMain cri) throws IllegalStateException, IOException {		
		log.debug("updateUserProfilePhoto({}, {}, {}, {}) invoked.", file, profileText, nickname, cri);
		
		Objects.requireNonNull(this.mapper);
		
		String uploadPath = "";
        
        String path = "C:/awsTemp/"; // 파일 업로드 경로
            
        String original = file.getOriginalFilename(); // 업로드하는 파일 name 
        uploadPath = path+original; // 파일 업로드 경로 + 파일 이름
        
        try {
            file.transferTo(new File(uploadPath)); // 파일을 위에 지정 경로로 업로드
        } catch (IllegalStateException e) {
            
            e.printStackTrace();
        } catch (IOException e) {
            
            e.printStackTrace();
        } //try-catch
		
		Regions clientRegion = Regions.AP_NORTHEAST_2;
        String bucketName = "younghoon";
        //String stringObjKeyName = "123";			//올린파일설명제목
        String fileName = uploadPath; 	//올릴파일 경로
        String fileNameExtension=FilenameUtils.getExtension(fileName).toLowerCase();
        String destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
        String fileObjKeyName = destinationFileName;				//클라우드에 올라가는 파일 이름
        
        try {

            AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
                    .withRegion(clientRegion)
                    .build();    
          
            PutObjectRequest request = new PutObjectRequest(bucketName, fileObjKeyName, new File(fileName));
            ObjectMetadata metadata = new ObjectMetadata();
            
            metadata.setContentType(metadata.getContentType());
            metadata.addUserMetadata("title", "someTitle");
            request.setMetadata(metadata);
            s3Client.putObject(new PutObjectRequest(bucketName, fileObjKeyName, new File(fileName)));
            
        } catch (AmazonServiceException e) {
         
            e.printStackTrace();
        } catch (SdkClientException e) {
            
            e.printStackTrace();
        } finally {
        	if(uploadPath != null) {
        		File fileLocal = new File(uploadPath);
        		fileLocal.delete();
        	} //if
        } //try-catch-finally
		
		if(this.mapper.updateUserProfilePhoto(destinationFileName, profileText, nickname, cri.getUserid()) == 1) {
			
			return true;
		} else {
			
			return false;
		} //if-else
		
	} //updateUserProfilePhoto
	
	@Override
	public boolean updateUserProfile(String profileText, String nickname, CriteriaMain cri) {
		log.debug("updateUserProfile({}, {}, {}) invoked.", profileText, nickname, cri);
		
		Objects.requireNonNull(this.mapper);
		
		if(this.mapper.updateUserProfile(profileText, nickname, cri.getUserid()) == 1) {
			
			return true;
		} else {
			
			return false;
		} //if-else
		
	} //updateUserProfile
	

} //end class