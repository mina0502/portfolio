function response(room, msg, sender, isGroupChat, replier, imageDB, packageName) 
{ 
	if (room == "톡방이름") 
	{ msg = msg.trim(); msg = msg.replace(/ /g, "");
		if (msg == "내이름") { replier.reply(sender + " 입니다."); 
	} 
		if (msg == "니이름") { replier.reply("bot"); } 
			if(sender == "월공"){ 
				if(msg=="/개발테스트"){ 
					replier.reply(room + " || " + msg + " || " + sender + " || " + isGroupChat + " || " + replier + " || " + imageDB + " || " + packageName); } 
			} 
		} 

if (msg.trim() == "/영화" || msg.trim() == ".영화") {
	var mdata = Utils
			.getWebText("https://m.search.naver.com/search.naver?where=m&sm=mtb_etc&query=현재상영영화");
	var mdata2 = mdata.split('<div class="card_content">');
	var mdata3 = mdata2[1].split('<div class="cm_error_no_result');
	var mdata4 = mdata3[0].replace(/(<([^>]+)>)/g, "");
	mdata4 = mdata4.trim();
	mdata4 = mdata4.replace(/평점/g, "★");
	mdata4 = mdata4.replace(/\n/g, "");
	mdata4 = mdata4.replace(/ /g, "");
	mdata4 = mdata4.replace(/ /g, "");
	mdata4 = mdata4.replace(/개봉/g, "\n개봉 ");
	mdata4 = mdata4.replace(/출연/g, "\n출연 ");
	mdata4 = mdata4.replace(/예매하기예고편/g, "\n💙");
	replier.reply(mdata4);
	}
}