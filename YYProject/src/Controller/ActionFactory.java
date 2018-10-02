package Controller;

import Action.Action;
import Action.BoardDeleteAction;
import Action.BoardUpdateFormAction;
import Action.ChangePass;
import Action.ChangePassCheck;
import Action.CheckIdAction;
import Action.CommentDeleteAction;
import Action.CommentWriteAction;
import Action.DeletePassCheck;
import Action.FindChangeIdEmail;
import Action.FindChangePass;
import Action.FoodListAction;
import Action.JoinAction;
import Action.LoginAction;
import Action.LogoutAction;
import Action.SearchAction;

public class ActionFactory {
	public Action getAction(String actionName) {
		Action action = null;
		
		if(actionName.equals("userLogin")) {	// " " = actionName으로 넘긴 value값
			action = new LoginAction();
		}else if(actionName.equals("userJoin")) {	
			action = new JoinAction();
		}else if(actionName.equals("checkId")) {
			action = new CheckIdAction();
		}else if(actionName.equals("userLogout")) {
			action = new LogoutAction();
			
			
		}else if(actionName.equals("search")) {
			action = new SearchAction();	
			
			
		}else if(actionName.equals("list")) {
			action = new FoodListAction();
		}else if(actionName.equals("boardDelete")){
			action = new BoardDeleteAction();
		}else if(actionName.equals("boardUpdateForm")) {
			action = new BoardUpdateFormAction();
			
			
		}else if(actionName.equals("findChangeIdEmail")) {
			action = new FindChangeIdEmail();
		}else if(actionName.equals("findChangePass")) {
			action = new FindChangePass();
		}else if(actionName.equals("changePass")) {
			action = new ChangePass();
		}else if(actionName.equals("changePassCheck")) {
			action = new ChangePassCheck();
		}else if(actionName.equals("deletePassCheck")) {
			action = new DeletePassCheck();
		}
		
		
		else if(actionName.equals("commentWrite")) {
			action = new CommentWriteAction();
		}else if(actionName.equals("commentDelete")) {
			action = new CommentDeleteAction();
		}
		
		
		else {	// actionName값이 없을때 띄우기위해서 존재
			action = new FoodListAction();
		}
		
		return action;
	}
}
