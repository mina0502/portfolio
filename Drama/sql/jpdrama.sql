-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: jdramadb
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jpdrama`
--

DROP TABLE IF EXISTS `jpdrama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jpdrama` (
  `jp_filename` varchar(200) DEFAULT NULL,
  `jp_code` varchar(200) NOT NULL,
  `jp_name` varchar(200) NOT NULL,
  `jp_bu` varchar(200) DEFAULT NULL,
  `jp_description` varchar(500) DEFAULT NULL,
  `jp_genre` varchar(500) DEFAULT NULL,
  `jp_broad` varchar(20) DEFAULT NULL,
  `jp_person` varchar(300) DEFAULT NULL,
  `jp_date` varchar(1000) DEFAULT NULL,
  `jp_year` int DEFAULT NULL,
  PRIMARY KEY (`jp_code`),
  UNIQUE KEY `jp_name_UNIQUE` (`jp_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpdrama`
--

LOCK TABLES `jpdrama` WRITE;
/*!40000 ALTER TABLE `jpdrama` DISABLE KEYS */;
INSERT INTO `jpdrama` VALUES ('요츠바.jpg','P000001','요츠바 은행 하라시마 히로미가 외친다 ~ 이 여자에게 걸어라~','8부작','은행에서 일하는 주인공의 대담한 발상과 행동력으로 실적 부진의 지점을 재건해 나가는 모습을 그린 드라마','드라마','TV도쿄','마키 요코, 마루야마 류헤이, 츠카모토 타카시, 미야케 히로키, 모리나가 유키','2021-05-01 11:29:01.251870',2019),('JOKER X FACE.jpg','P000002','JOKER X FACE','10부작','인터넷 동영상을 둘러싼 범죄 엔터테인먼트물 마츠모토 호노카는 \'JOKER\'라는 동영상 전송 채널을 운영하며 돈벌이를 하는 수수께끼의 미녀 루카와를 연기, 마츠오 사토루는 루카와의 감언이설에 넘어가 동영상 제작 일을 맡게 되는 중년 남성 야나기를 연기','범죄','후지TV','마츠모토 호노카, 마츠오 사토루, 스도 우렌','2021-05-01 11:29:01.256139',2019),('절약록.jpg','P000003','절약 록','10부작','록을 사랑하는 독신 샐러리맨이 연인을 되찾기 위해 절약에 눈을 뜨게 되며 벌어지는 이야기를 그린 드라마','코믹, 심야','NTV','우에다 타츠야, 시게오카 다이키, 후지이 미나, 아야카 윌슨','2021-05-01 11:29:01.259650',2019),('와카코와 술4.jpg','P000004','와카코와 술 4','12부작','여주인공이 혼자 술과 맛있는 안주를 즐길 수 있는 곳을 찾아다니며 인생을 즐기는 이야기','일상','BS JAPAN','타케다 리나, 노조에 요시히로, 카마카리 켄타','2021-05-01 11:29:01.262981',2019),('트레이스~과수연의 남자~.jpg','P000005','트레이스~과수연의 남자~','11부작','과수연 법의 연구원인 주인공이 신인 법의 연구원, 베테랑 형사와 사건을 해결해가는 이야기를 그린 드라마','수사,형사','후지tv','니시키도 료, 아라키 유코, 야마자키 시게노리, 오카자키 사에','2021-05-01 11:29:01.267826',2019),('신 아사미 미츠히코 시리즈.png','P000006','신 아사미 미츠히코 시리즈 ~ 아마기토우게 살인사건 (SP)','1부작','아마기토우게에서 일어나는 사건','스릴러','TBS','히라오카 유타,이치게 요시에,타니무라 미츠키,마사미 호리우치,오미 토시노리','2021-05-01 11:29:01.271099',2019),('BRIDGE.png','P000007','BRIDGE 시작은 1995.1.17고베 (SP)','1부작','1995년 6천명이 넘는 희생자를 낸 한신·이와지 대지진의 실제 사건을 바탕으로 한 휴먼 드라마','드라마','후지TV','이우라 아라타, 노무라 슈헤이, 아오이 와카나, 시이나 킷페이','2021-05-01 11:29:01.274512',2019),('오카즈군.jpg','P000008','광고 회사, 남자 기숙사의 오카즈군','10부작','광고 회사의 남자 기숙사를 무대로 하는 요리 드라마','드라마','TVK','쿠로바 마리오, 사키야마 츠바사, 코바야시 카츠야, 오오야마 마사시, 하시모토 미와, 히사노 마사히로, 콘고우치 타케시, 도쿠이 유, 아카마 마리코','2021-05-01 11:29:01.277983',2019),('1페이지.jpg','P000009','1페이지의 사랑','6부작','4년전 그토록 좋아했지만 홀연히 모습을 감췄던 첫사랑에 대한 기억을 안고 그림을 그리는 21세 취준생 아카리 우연히 유흥가에서 첫사랑 모리타와 재회하면서 일어나는 일','로맨스, 멜로','AbemaTV','하시모토 칸나, 이타가키 미즈키, 오오노 이토, 하마다 타츠오미, 후루카와 유키, 모리야 칸나, 타키자와 사오리, 아시나 세이, 시부야 켄토, 야기 아리사, 타구치 히로마사','2021-05-01 11:29:01.281313',2019),('어젯밤.jpg','P000010','어젯밤은 즐거우셨나요 ','6부작',' 온라인 게임 드래곤 퀘스트 X를 모티브로 한 러브 코미디 드라마','코미디, 로맨스',' TBS','혼다 츠바사, 오카야마 아마네, 미야노 마모루, 유우타로, 카케이미와코, 이나바 유우','2021-05-01 11:29:01.284634',2019),('처음 사랑.jpg','P000011','처음 사랑을 한 날에 읽는 이야기','10부작',' 여자 주인공을 둘러싸고 라이벌이 되는 세 명의 남자의 이야기를 그린 러브 코미디 드라마',' 코미디, 로맨스',' TBS','후카다쿄코, 야쿠모 마사시, 유리 코헤이, 야마시타 카즈마','2021-05-01 11:29:01.340141',2019),('후처업.jpg','P000012','후처업','9부작','고령자의 유산을 노리고 결혼 사기를 하는 후처업의 이야기를 담은 서스펜스 드라마','스릴러','후지TV','기무라 요시노, 타카하시 카츠노리, 키무라 타에, 하야마 쇼노, 하세가와 토모하루, 시노다 마리코, 히라야마 유스케','2021-05-01 11:29:01.346920',2019),('다녀왔습니다.png','P000013','다녀왔습니다. 오스 상점가','1부작','27 년 만에 고향 오스로 돌아온 주인공 마츠다 쿠미코가 재차 지역의 매력을 느껴가는 스토리','드라마','토카이TV','마츠시타 유키, 나카무라 카즈히코, 이토 마이코, 콘도 요시미사, 벤가루, 히라이즈미 세이','2021-05-01 11:29:01.352716',2019),('이에야스.jpg','P000014','이에야스, 에도를 짓는다','2부작','한촌에서 대도시 에도를 계획 한 드리머 이에야스의 꿈에 인생을 건 뜨거운 남자들의 이야기를 담은 드라마','드라마','NHK','사사키 쿠라노스케, 나마세 카츠히사, 유카, 치바 유다이, 타카시마 마사노부, 마츠세게 유타카, 이치무라 마사치카','2021-05-01 11:29:01.411119',2019),('잠비.jpg','P000015','잠비','10부작',' 프리지아 학원을 무대로 동료와의 우정을 그리는 휴먼 서스펜스 드라마','학원, 스릴러','NTV','사이토 아스카, 호리 미오나, 요다 유우키, 아키모토 마나츠, 호시노 미나미, 테라다 란제, 야마시타 미즈키','2021-05-01 11:29:01.424861',2019),('방랑온천.png','P000016','방랑온천 엔도켄이치','12부작','은퇴 소문의 진상을 확인하러 간 방송국 스태프가 온천 여관에서 일하는 주인공을 찾는 온천 다큐멘터리 드라마','다큐, 드라마','도쿄TV','엔도 켄이치','2021-05-01 11:29:01.433533',2019),('집을 파는.jpg','P000017','집을 파는 여자의 역습','10부작','고객과 그 가족이 직면한 문제를 해결함으로써 어떠한 집이든지 척척 팔아치우는 능력을 가진 천재 부동산 업자의 이야기','드라마','NTV','키타가와 케이코, 마츠다 쇼타, 쿠도 아스카, 이모토 아야코, 스즈키 히로키, 혼다 치카라, 쿠사카와 타쿠야','2021-05-01 11:29:01.440744',2019),('파트너.jpg','P000018','파트너 시즌17','20부작','괴짜 천재 경부와 사람 좋은 순사 부장이 사건을 해결하는 드라마','추리, 수사','TV아사히','미즈타니 유타카, 소리마치 타카시, 스즈키 안쥬, 카와하라 카즈히사, 야마나카 타카시, 야마니시 아츠시, 아사리 요스케','2021-05-01 11:29:01.444358',2019),('형사제로.png','P000019','형사제로','10부작','20년간의 기억을 잃고 형사로서의 상식도 수사 기법 그리고 노하우도 모두 사라져 버린 베테랑 형사가 전례와 그동안의 상식에 얽매이지 않고 사건을 해결해가는 모습을 그린 드라마','수사','TV아사히','사와무라 잇키, 타키모토 미오리, 테라지마 스스무, 요코야마 다이스케, 네코제 츠바키, 와타나베 잇케이, 자이젠 나오미','2021-05-01 11:29:01.448206',2019),('Queen.jpg','P000020','스캔들 전문 변호사 Queen','10부작','필요하다면 거짓말조차 정의로 바꾸는 놀라운 솜씨의 스핀 닥터인 주인공이 다양한 스캔들과 대치하면서 궁지에 몰린 여자들을 구하는 모습을 그린 드라마','드라마','후지TV','다케우치 유코, 미즈카와 아사미, 나카가와 타이시, 바카리즈무, 사이토 유키','2021-05-01 11:29:01.457713',2019),('인생.jpg','P000021','인생이 즐거워지는 행복의 법칙','10부작','3명의 여성이 조금 특이한 신의 세계를 오가며 각각 행복을 향해 가는 모습을 그린 이야기','드라마','NTV','나츠나, 타카하시 메리준, 코바야시 키나코, 사노 히나코, 오시나리 슈고, 이토 슈코, 도쿠이 유, 타야마 료세이','2021-05-01 11:29:01.463248',2019),('과수연.png','P000022','과수연의 여자 시즌 18','8부작','과학수사연구소 팀원들의 활약상을 그린 추리 드라마','추리','TV아사히','사와구치 야스코, 나이토 타카시, 와카무라 마유미, 카자마 토오루, 카네다 아키오, 사이토 사토루, 와타나베 슈','2021-05-01 11:29:01.467070',2019),('아타루.jpg','P000023','파견 점술사 아타루','9부작','모든 것이 보이는 능력을 가진 파견사원이 주위 정규직들이 안고 있는 고민을 해결해 나가며 벌어지는 이야기를 코믹하게 그린 드라마','코미디, 드라마','TV아사히','스기사키 하나, 오자와 유키요시, 시다 미라이, 마미야 쇼타로, 시손 쥰, 노나미 마호, 이타야 유카','2021-05-01 11:29:01.471960',2019),('디자이너.jpg','P000024','디자이너 시부이 나오토의 휴일','12부작','독신 디자이너의 일상과 연애 이야기를 그린 드라마','로맨스, 드라마','도쿄TV','미츠이시 켄, 오카야마 아마네, 이케마츠 소스케, 카호, 이와마츠 료, 카와에이 리나, 야나기 에리사, 리리카, 이케다 에라이자','2021-05-01 11:29:01.476834',2019),('코키치.jpg','P000025','코키치의 아내','8부작','가난한 무사 집안으로 지혜로운 아내와 전대미문 남편의 이야기를 그린 드라마','드라마','NHK BS','사와구치 야스코, 후루타 아라타, 스즈키 후쿠, 에나미 쿄코, 마스 타케시, 다카하시 카즈야, 타카하시 히토미','2021-05-01 11:29:01.480294',2019),('특촬.jpg','P000026','특촬 가가가','7부작','일생 생활에서 직면하는 일들에 긍정적으로 분투하는 주인공의 이야기를 그린 코믹 드라마','코미디','NHK','코시바 후우카, 쿠라시나 카나, 키나미 하루카, 모리나가 유우키, 혼다 타카후미, 다케다 레나, 우치야마 미코토','2021-05-01 11:29:01.484047',2019),('메종.jpg','P000027','메종 드 폴리스','10부작',' 젊은 여형사와 경험이 많은 경찰관들의 이야기를 그린 휴먼 드라마','드라마','TBS','타카하타 미츠키, 니시지마 히데토시, 코히나타 후미요, 노구치 고로, 카도노 타쿠조, 콘도 마사오미','2021-05-01 11:29:01.488422',2019),('아이즈.jpg','P000028','아이즈','13부작','평범한 남자 고등학생이 같은 반에 좋아하는 미소녀 그리고 소꿉친구, 후배, 연상의 다양한 여성을 둘러싼 복잡한 연애를 그리는 이야기','로맨스','BS스파카','오카야마 아마네, 우고에 유우키, 미즈이시 아토무, 우카지 타카시, 도요시마 케이스케, 시라이시 세이, 시바타 쿄카','2021-05-01 11:29:01.492460',2019),('도쿄BTH.jpg','P000029','도쿄BTH~TOKYO BLOOD TYPE HOUSE~','10부작','혈액형을 테마로 드라마와 프라이빗 토크를 섞은 신감각 드라마로 이나가키 고로가 자신과 같은 혈액형의 캐릭터에 심취하여, 혈액형으로 인한 성격 차이와 있을 법한 에피소드를 펼친다','코미디','AmazonePrime','이나가키 고로, 카나메 준, 카츠지 료','2021-05-01 11:29:01.495815',2019),('후르츠.jpg','P000030','후르츠 택배','12부작','사연 있는 여성들과 출장 접대업에서 일하게 된 점장의 이야기를 그린 드라마','도쿄TV','드라마','하마다 가쿠, 나카 리이사, 마츠오 스즈키, 아라카와 요시요시, 마에노 토모야, 토쿠나가 에리, 야마시타 리오, 키타하라 리에, 타나카 테츠시, 하라 후키코, 우치야마 리나, 나루미 리코, 후루타치 칸지, 와타나베 마키코, 야마구치 미야코','2021-05-01 11:29:01.500148',2019),('아저씨.jpg','P000031','나의 아저씨 ~WATAOJI~','8부작','버라이어티 프로그램 신인 AD 앞에 요정 아저씨가 나타나며 벌어지는 이야기','드라마, 코미디','TV아사히','오카다 유이, 엔도 켄이치, 시로타 유, 코테 신야, 토즈카 준키, 아오키 사야카, 다나베 세이치','2021-05-01 11:29:01.504355',2019),('3학년A반.jpg','P000032','3학년A반 지금부터 여러분은 인질입니다','10부작','유서 없이 갑자기 세상을 떠난 학생의 진상을 마주하기 위해 한 교사가 학생들을 인질로 잡아 벌어지는 이야기를 그린 학원 미스터리 드라마','미스터리, 학원','NTV','스다마사키, 나가노 메이, 시아나 깃페이','2021-05-01 11:29:01.507860',2019),('사쿠라2.jpg','P000033','사쿠라의 오야코동2','8부작','갈 곳 없고 배고픈 사람들을 위해 오야코동을 대접하며 그들의 상처를 어루만져주는 휴먼 드라마','드라마','토카이TV','마야 미키, 에모토 토키오, 이가시라 마나미, 오카모토 나츠미, 시바타 쿄카,아사기 이치카, 이노리 키라라','2021-05-01 11:29:01.515646',2019),('첫사랑.jpg','P000034','내 첫사랑을 너에게 바친다','7부작','심장병을 앓고 있는 소년과 그의 주치의 딸인 소녀의 순애보를 그린 드라마','드라마, 로맨스','TV아사히','노무라 슈헤이, 사쿠라이 히나코,바바 후미카, 마츠이 아이리, 야하기 호노카, 키즈 타쿠미, 토미타 켄타로','2021-05-01 11:29:01.519065',2019),('돌아갈게.jpg','P000035','어머니, 돌아갈게~ AI의 유언~','1부작','인공지능으로 인해 가족의 붕괴와 재생 이야기를 그린 홈드라마','드라마','NHK','야기라 유야, 키시모토 카요코, 이치카와 미카코, 노마구치 토오루, 오쿠다 에이지','2021-05-01 11:29:01.522330',2019),('베트남의 빛.jpg','P000036','베트남의 빛~내가 무상의료를 시작한 이유~','1부작','베트남에서 15년 넘게 무상의료를 해오고 있는 안과 의사 이야기를 그린 드라마','드라마','NHK','하마다 가쿠, 쿠니나카 료코, 키무라 미도리코, 레권, 빈안, 레치나, 티엔고','2021-05-01 11:29:01.525490',2019),('다잉아이.png','P000037','다잉아이','6부작','과거에 교통사고 가해자였으나 어떤 사건으로 인해 당시의 상세한 기억을 잃어버린 주인공을 둘러싸고 벌어지는 이야기를 그린 드라마','서스펜스, 스릴러','WOWOW','미우라 하루마, 타카하시 메리준, 마츠모토 마리카, 카키자와 하야토, 오노즈카 하야토, 후치카미 야스시, 키무라 유이치','2021-05-01 11:29:01.528653',2019),('미키클리닉.jpg','P000038','미키 클리닉에서 건배를','10부작','VIP 전문 병원을 배경으로 동명의 소설을 원작으로 한 드라마','드라마','BS TOKYO','미우라 타카히로, 안도 마사노부, 야마시타 미즈키, 마츠모토 마리카, 야나시 슌타로, 다케나카 나오토, 우스다 아사미','2021-05-01 11:29:01.531732',2019),('그것사랑.jpg','P000039','그것을 사랑과 착각하니까','5부작','결혼 15년째를 맞이한 부부가 서로 다른 연인이 있는 사실을 알게 되며 벌어지는 이야기를 그린 드라마','드라마','WOWOW','이나모리 이즈미, 스즈키 코스케, 나카 리이사, 안도 마사노부, 와타나베 다이치, 리리코, 메구미','2021-05-01 11:29:01.535955',2019),('숙소.jpg','P000040','일본 낡은 숙소 기행','12부작','일본 전국의 낡은 숙소를 소재로 그린 드라마','드라마, 다큐','TV도쿄','후카가와 마이, 타카하시 카즈야, 히라타 미츠루, 츠루타 마유','2021-05-01 11:29:01.540104',2019),('기억수사1.jpg','P000041','기억수사 ~신주쿠 동서 사건 파일~','7부작','경시청 신주쿠 동서 형사과 사법계를 무대로 형사의 활약을 그린 드라마','형사, 수사','TV도쿄','키타오오지 킨야, 카자마 슌스케, 키미시라 이시 모네, 우치다 아사히, 마츠모토 타이시, 카츠노 히로시, 타쿠마 신','2021-05-01 11:29:01.543199',2019),('오오카.jpg','P000042','오오카 에치젠 스페셜 ~ 친자를 잇는 명판관~','1부작','주인공 오오오카 타다스케가 새로운 임무 \'관동지방어용쾌\'를 수행하는 가운데 그의 아이가 실종되면서 벌어지는 이야기','스릴러','NHK','히가시야마 노리유키,카츠무라 마사노부, 테라와키 야스후미, 엔도 쿠미코, 단 미츠, 타무라 료, 다카하시 미츠오미','2021-05-01 11:29:01.546220',2019),('낚시바보SP.jpg','P000043','낚시 바보 일지 ~신입 사원 하마사키 덴스케~ 세토나이카이에서 대어! 결혼식 대패닉편','1부작','중년이 된 회사원 하마사키의 신입 사원 시절 결혼 에피소드를 그린 드라마','드라마,코미디','TV도쿄','하마다 가쿠, 히로세 아리스, 후키코시 미츠루, 키타로, 타나베 모모코, 나다카 타츠오, 오노 료','2021-05-01 11:29:01.549238',2019),('코코아.jpg','P000044','코코아','1부작','부모의 불륜과 바람, 학교친구들과의 불화, 이지메, 자살충동 등 제각기 불안정한 상황과 그로 인한 정서적 불안에 휩쌓인 10대 소녀 3명의 이야기를 그리고 있다','드라마, 청춘','후지TV','미나미 사라, 데구치 나츠키, 나가세 리코, 카미오 후쥬, 와타나베 다이치, 카미오 유우, 콘노 마히루, 사이토 타쿠미, 우노 미사코','2021-05-01 11:29:01.552670',2019),('전영소녀SP.jpg','P000045','전영소녀 - VIDEO GIRL AI 2019 - 특별편 (SP)','1부작','쇼의 곁에 더 머물고 싶지만 벽에 부딪힌 아이가 우연히 길에서 만난 미아를 보살펴 주면서 쇼와의 행복한 추억을 떠올리는 이야기','드라마, 로맨스, 코미디','TV도쿄','니시노 나나세, 노무라 슈헤이, 토츠기 시게유키','2021-05-01 11:29:01.556163',2019),('초승달.jpg','P000046','초승달','5부작','학원 업계를 무대로 일본 교육에 모든 것을 바친 학원 교육자들의 그리고 가족의 이야기를 그린 드라마','드라마','NHK','타카하시 잇세이, 나가사쿠 히로미, 후부키 준, 쿠로카와 메이, 쿠도 아스카, 오오마사 아야, 사쿠라이 히나코','2021-05-01 11:29:01.559341',2019),('얼굴.jpg','P000047','빼앗긴 얼굴 ~미아타리 수사반~','5부작','얼굴만을 근거로 잠복하여 수배범을 잡는 \'미아타리 수사원\'인 주인공은 어느 날 의문사를 당한 선배 형사의 얼굴을 보게 되며 벌어지는 이야기를 그린 드라마','수사, 추리','WOWOW','타마키 히로시, 우치다 리오, 마치다 케이타, 시부카와 키요히코, 이토 아유미, 마루야마 토모미, 야마자키 시게노리','2021-05-01 11:29:01.562915',2019),('변호사.jpg','P000048','이노센스 원죄변호사','10부작','누명의 희생양이 된 약자들을 위해 현장에서 일어난 현상을 실험으로 재현해 사건의 진상을 밝혀내는 변호사와 동료들의 모습을 그린 드라마','수사, 추리','NTV','후지키 나오히토, 사카구치 켄타로, 카와구치 하루나','2021-05-01 11:29:01.566180',2019),('좀비.jpg','P000049','좀비가 왔으니까 인생을 되돌아보고','8부작','한 지방 도시에서 좀비가 발생하여 좀비들과 맞닥뜨리게 된 30대 여성들의 이야기를 그린 드라마','좀비','NHK','이시바시 나츠미, 츠치무라 카호, 타키우치 쿠미, 다이토 슌스케, 와타나베 다이치, 야마구치 요시유키, 카타야마 유키','2021-05-01 11:29:01.569361',2019),('남극.jpg','P000050','재미있는 남극요리인','12부작','요리 담당 대원을 중심으로 극한지대에서 생활하는 남극탐험대 대원들의 희로애락을 담은 드라마','일상','TV오사카','하마노 겐, 마키타 스포츠, 타나카 요지, 히다 야스히토, 야마나카 타카시, 후쿠야마 쇼다이, 이와사키 우다이','2021-05-01 11:29:01.572947',2019),('퍼펙트.jpeg','P000051','퍼펙트 크라임','10부작','위험한 사랑의 덫에 빠져가는 주인공의 모습을 그린 크라임 러브 스토리','범죄, 로맨스','TV아사히','트린들 레이나, 사쿠라다 도리, 오치아이 모토키, 나가오 마리야, 이토 유미, 마시마 히데카즈','2021-05-01 11:29:01.575842',2019),('원숭이.jpg','P000052','원숭이 이외의 혹성','2부작','동물 인간들과 인간이 사는 사회에서 매일 웃고 우는 이야기','코미디','NHK','다이토 슌스케, 토다 케이코, 코바야시 유이, 토즈카 준키, 우콘 요시유키, 세오 토모미, 야부키 하루토, 야부키 호노카','2021-05-01 11:29:01.579032',2019),('파트주부.png','P000053','넷 가희~ 파트타임 주부가, 노래해 보았다~','1부작','평범한 주부가 유튜브에 노래방 영상이 공개된 것을 계기로 본격적인 SNS스타로 거듭나는 과정을 그린 드라마','일상','NHK','오기노메 요코, 타카하시 카츠노리, 아사카 코다이, 타키자와 사오리, 진보 사토시','2021-05-01 11:29:01.582242',2019),('이다텐.jpg','P000054','이다텐 ~도쿄 올림픽 이야기~ ','47부작','일본의 마라톤 선수가 최초로 참여한 1912년 스톡홀름 올림픽을 시작으로 1964년 도쿄 올림픽까지, 올림픽을 대회를 중심으로 본 일본의 50년 근현대사를 다룬 대하 드라마','대하드라마','NHK','아베 사다오,나카무라 칸쿠로, 아야세 하루카, 비트 타케시, 모리야마 미라이, 오오타케 시노부, 야쿠쇼 코지, 나가야마 켄토, 호시노 겐, 카와에이 리나, 하시모토 아이','2021-05-01 11:29:01.585237',2019),('굿와이프.jpg','P000055','굿와이프','10부작','남편이 스캔들로 인해 체포되어 16년 만에 변호사로 복귀하는 아내가 수많은 어려움에 포기하지 않고 맞서는 이야기를 그린 법률 휴먼 드라마','휴먼, 드라마','TBS','토키와 타카코, 고이즈미 코타로, 미즈하라 키코, 키타무라 타쿠미, 노마구치 토오루, 나카바야시 타이키, 스에나가 미유','2021-05-01 11:29:01.589145',2019),('먼로.jpg','P000056','먼로가 죽은 날','4부작','남편을 먼저 하늘로 떠나보내고 어느 날 쇼핑 중 공황증상을 일으킨 주인공은 정신과 진료를 받게 되어 그곳에서 만난 남자와 서로 끌리게 되며 벌어지는 이야기를 그린 드라마','로맨스','NHK','스즈키 쿄카, 쿠사카리 마사오, 아소우 유미, 사츠카와 아이미, 우자키 류도, 네기시 토시에','2021-05-01 11:29:01.592902',2019),('고고한.jpg','P000057','고고한 메스','8부작','장기 이식이 금지되고 있던 1980년대 후반, 의료 선진국 미국에서 연구를 했던 외과 의사가 지방의 민간 병원에 부임하게 되며 벌어지는 이야기를 담은 의학 드라마','의학','WOWOW','타키자와 히데아키, 나카무라 토오루, 쿠도 아스카, 야마모토 미즈키, 이시마루 칸지, 나가츠카 쿄조','2021-05-01 11:29:01.602109',2019),('반상.jpg','P000058','반상의 알파~약속의 장기~','4부작','장기 세계를 무대로 부활을 목표로 하는 두 남자와 그들을 사랑하는 사람들 사이에서 벌어지는 이야기를 그린 드라마','일상, 드라마','NHK','타마키 히로시, 히가 마나미, 카미지 유스케, 노노 스미카, 야스이 준페이, 호리이 아라타, 오카 마유미','2021-05-01 11:29:01.605830',2019),('집비밀.jpg','P000059','우리집의 비밀','5부작','네 가족의 비밀을 부부의 대화를 중심으로 유머러스하게 그린 드라마','일상, 코미디','NHK','사토히토미, 타나카 나오키, 야시마 노리토, 나가이 마사루, 키시타니 고로','2021-05-01 11:29:01.609730',2019),('절규.jpg','P000060','절규','4부작','사회로부터 버림받은 한 여성이 살아남기 위해 보험금 살인 사건에 손을 뻗게 되며 벌어지는 이야기를 그린 드라마','서스펜스, 스릴러','WOWOW','오노 마치코, 야스다 켄, 코니시 마나미, 카타기리 진, 마에카와 야스유키, 코야나기 유, 카쿠 토모히로','2021-05-01 11:29:01.613201',2019),('레미제라블.jpg','P000061','레 미제라블 끝없는 여로 (SP)','1부작','2년 전 17세의 소년 바바 준이 정당방위 끝에, 죽여버린 상대는, 어머니 유코를 속여서 전 재산을 뜯어낸 남자 사이토 후토시 병든 남동생의 수술비를 벌기 위해 아르바이트를 열심히 하고 있었던 준이었지만, 형사처벌이 되어, 소년 형무소에 들어가게 되는 이야기','서스펜스','후지TV','딘 후지오카, 이우라 아라타, 야마모토 미즈키, 요시자와 료, 무라카미 니지로, 키요하라 카야, 마츠시타 코헤이, 시미즈 히로야, 후쿠다 마유코, 하세가와 쿄코, 카네코 노부야키, 카리나','2021-05-01 11:29:01.617288',2019),('경시청과장.jpg','P000062','경시청 수사 1과장 신춘 스페셜 SP','1부작','10년 전 강도살인범이 보석투성이 시신으로 발견됐다. 사건의 열쇠를 쥐고있는 것은 \"기억\" 오오이와와 \"경시청일의 기억력\"을 자랑하는 쿨 뷰티한 여형사가 복잡하게 얽힌 과거와 현재의 사건의 수수께끼에 도전한다! 과거를 잊고 화려하게 환생한 목격자의 아내가 가진 비밀이란...!?','수사, 추리','TV아사히','나이토 타카시, 사이토 유키, 카네다 아키오, 스즈키 히로키, 야노 코지, 혼다 히로타로','2021-05-01 11:29:01.621476',2019),('의혹.jpg','P000063','의혹','1부작','민사 사건들을 다루는 변호사들의 이야기를 그린 드라마','스릴러, 서스펜스','TV아사히','요네쿠라 료코, 쿠로키 하루, 요 키미코, 아타오 이츠지, 나가야마 켄토, 유, 카츠무라 마사노부','2021-05-01 11:29:01.625370',2019),('왕.jpg','P000064','새로운 왕','8부작','가치관이 전혀 다른 두 인물이 방송국 인수를 위한 경쟁 이야기를 그린 드라마','드라마','TBS','카가와 테루유키, 후지와라 타츠야, 타케다 레나, 스기노 요스케','2021-05-01 11:29:01.628944',2019),('하얀거탑.jpg','P000065','하얀거탑','21부작','원작소설을 바탕으로 병원에서 벌어지는 이야기를 그린 드라마','의학, 드라마','후지TV','카라사와 토시아키, 에구치 요스케, 쿠로키 히토미, 야다 야키코, 미즈노 마키','2021-05-01 11:29:01.632915',2019),('내사랑.jpg','P000066','나는 아직 너를 사랑하지 않을 수 있다','16부작','늘 티격태격하지만 15년 동안 서로의 가장 친한 친구로 지내온 요우와 렌. 요우의 스물 아홉번째 생일날, 두 사람은 서로 먼저 결혼하는 사람에게 30만엔의 축의금을 주는 내기를 하게 된다','로맨스, 드라마','FOD','아다치 리카, 시라스 진, 아사카 코다이, 마츠모토 키요, 나가노 무네노리, 사쿠마 유우, 사오리','2021-05-01 11:29:01.636762',2019),('라스트.jpg','P000067','라스트 찬스 ~기업회생 전문가~','8부작','벼랑 끝에 몰린 음식 프랜차이즈 기업의 재건에 도전하는 내용을 그린 드라마','드라마','TV도쿄','나카무라 토오루, 시이나 깃페이, 카츠무라 마사노부, 와다 마사토','2021-05-01 11:29:01.640836',2018),('채널.jpg','P000068','채널고정','5부작','홋카이도 지역을 기반으로 하는 로컬방송국 \'호시테레비\'를 무대로 가능성만 보고 뽑힌 사고뭉치 신입사원 \'유키마루\'와 동기들의 혹독한 방송적응기를 보여주며 로컬방송국의 생리와 저력을 보여주는 작품','드라마','HTB','요시네 쿄코, 이이지마 히로키, 미야시타 카나코, 오사다 타쿠로, 후지무라 타다히사, 오오우치 아츠오, 야스다 켄, 오오이즈미 요, 네기시 토시에, 모리사키 히로유키, 오토오 타쿠마, 이즈미야 시게루, 사카이 토시야, 토츠기 시게유키, 모모타 카나코','2021-05-01 11:29:01.644649',2019),('해러스.jpg','P000069','해러스먼트 게임','9부작','대기업에서 어느 날 실장으로 임명된 주인공이 사내에서 일어나는 다양한 학대 문제를 기발한 아이디어로 해결하는 이야기를 그린 드라마','드라마','TV도쿄','카라사와 토시아키, 히로세 아리스, 후루카와 유우키, 이치카와 유이, 타키토 켄이치, 이시노 마코, 사노 시로','2021-05-01 11:29:01.648613',2018),('슈츠1.jpg','P000070','슈츠 SUITS','11부작','일본 4대 변호사 사무실 소속인 변호사와 그의 파트너가 다양한 소송에 도전하는 이야기를 그린 드라마','드라마, 수사','후지TV','오다 유지, 나카지마 유토, 아라키 유코, 나카무라 안, 이소무라 하야토, 이마다 미오, 쿠니무라 준','2021-05-01 11:29:01.652392',2018),('중학성.jpg','P000071','중학성일기','11부작','자신을 소중히 생각해주는 연상의 약혼자가 있으면서도 이상한 매력을 가진 10살 연하 중학생에게 마음이 끌리는 여교사의 금단의 사랑을 그린 휴먼 러브 스토리 드라마','드라마, 로맨스, 청춘','TBS','아리무라 카스미,오카다 켄시, 마치다 케이타, 오노리나, 토모 치카','2021-05-01 11:29:01.657188',2018),('우리기적.jpg','P000072','우리들은 기적으로 되어 있다','10부작','동물의 행동을 연구하는 동물 행동학의 강사인 주인공이 상식과 고정 관념에 얽매이지 않은 채 대학 강의를 하며 벌어지는 이야기를 담은 코믹 드라마','코미디','KTV','타카하시 잇세이, 에이쿠라 나나, 카나메 준, 코지마 카즈야, 니시하타 다이고, 야하기 호노카, 키타 카나','2021-05-01 11:29:01.661069',2018),('문학처녀.jpg','P000073','문학처녀','8부작','사랑을 잘 모르는 여자 주인공이 사랑을 잘 못 하는 남자 주인공인 인기 소설가의 관계 속에서 피어난 사랑을 그린 드라마','로맨스, 청춘','MBS','모리카와 아오이, 시로타 유, 나카오 마사키, 이즈미 리카, 카와하라 마사히코, 카토오노 타이코우, 타나베 모모코','2021-05-01 11:29:01.664481',2018),('짐승.jpg','P000074','짐승이 될 수 없는 우리','10부작','현대 여성과 세상을 잘 살아가는 독설 남자가 우연히 맥주 바에서 만나 벌어지는 이야기를 그린 러브 스토리 드라마','로맨스, 드라마','NTV','아라가키 유이, 마츠다 류헤이, 타나카 케이, 쿠로키 하루, 키쿠치 린코','2021-05-01 11:29:01.668246',2018),('귀족.jpg','P000075','PRINCE OF LEGEND','10부작','개성 넘치는 왕자들이 \'전설의 프린스\'를 두고 경쟁을 펼치는 이야기를 그린 드라마','드라마','NTV','시라하마 아란, 히로세 토모키, 나카지마 켄, 조이, 와타나베 히로유키, DAIGO, 아라마키 요시히코, 사토 류지, 하카마다 요시히코, 이타가키 미즈키, 마에다 고키, 야마모토 코지','2021-05-01 11:29:01.672019',2018),('텐텐.png','P000076','텐 텐호의 길을 걷는 쾌남아','12부작','주인공인 남자가 마작의 세계에서 최강인 전설을 만나 벌어지는 일본의 마작 세계의 이야기 담은 드라마','드라마','TV도쿄','키시타니 고로, 후루카와 유우키, 요시다 에이사쿠, 마토바 코지, 덴덴, 오카야마 하지메, 아이지마 카즈유키','2021-05-01 11:29:01.679853',2018),('황혼.jpg','P000077','황혼유성군','10부작','인생의 반환점을 지난 남녀가 우연히 만나 운명의 사랑에 빠지게 되며 벌어지는 이야기를 그린 드라마','로맨스','후지TV','사사키 쿠라노스케, 나카야마 미호, 후지이 류세이, 이시카와 렌, 나카가와 레이지, 야기 아키코, 오노 타케히코','2021-05-01 11:29:01.683846',2018),('블스.jpg','P000078','블랙 스캔들','10부작','음모로 인해 나락으로 떨어진 여배우의 모습을 연예계 속의 다양한 일들과 같이 그려낸 복수극 드라마','복수, 서스펜스','YTV','야마구치 사야카,안도 마사노부, 마츠이 레나, 와카바 류야, 모리타 간로, 오가와 사라, 타니가와 쇼이치로','2021-05-01 11:29:01.688494',2018),('리갈V.jpg','P000079','리갈 v ~전 변호사 타카나시 쇼코~','9부작','변호사 자격을 박탈당한 전직 변호사를 중심으로 벌어지는 이야기를 그린 법률 드라마','드라마','TV 아사히','요네쿠라 료코, 무카이 오사무, 하야시 켄토, 아라카와 요시요시, 나이토 리사, 아다치 유미, 미우라 쇼헤이','2021-05-01 11:29:01.692378',2018),('프리티.jpg','P000080','프리티가 너무 많아','10부작','대형 출판사 문예 편집부의 에이스로 있던 주인공이 하라주쿠계 패션 잡지로 이동 명령을 받게 되면서 벌어지는 이야기를 그린 드라마','드라마','NTV','치바 유다이, 사츠카와 아이미, 야지마 마이미, 이케하타 레이나, 쿠로바 마리오, 나가이 미지카, 모리야마 아스카','2021-05-01 11:29:01.696549',2018),('니자에몽.jpg','P000081','쿠모키리 니자에몽 4','7부작','의로운 도적과 그의 뛰어난 부하들, 그리고 이들을 잡으려는 자들이 공방전을 벌이는 시대극','시대극, 대하드라마','NHK BS','나카이 키이치, 쿠니무라 준, 우치야마 리나, 콘도 요시마사, 테즈카 토루, 다이토 슌스케, 와타나베 테츠','2021-05-01 11:29:01.700490',2018),('비망록3.jpg','P000082','타치바나 노보루 청춘 비망록 3','7부작','감옥에서 죄수를 치료하는 의사로 일하고 있는 주인공이 감옥 안팎에서 일어나는 다양한 사건을 해결해나가는 이야기를 그린 드라마','의료, 의학, 범죄','NHK BS','미조바타 준페이, 타이라 유우나, 미야자키 요시코, 마키타 스포츠, 마사나 보쿠조, 나미오카 카즈키, 와타나베 유타로','2021-05-01 11:29:01.704415',2018),('라쿠고.jpg','P000083','쇼와 겐로쿠 라쿠고 심중','10부작','만담 붐을 일으킨 젊은이들의 이야기를 그린 드라마','드라마','NHK','오카다 마사키, 류세이 료, 나루미 리코, 오오마사 아야, 야마자키 이쿠사부로,히라타 미츠루, 나카하라 타케오','2021-05-01 11:29:01.708722',2018),('카구라자카.jpg','P000084','나와 꼬리와 카구라자카','8부작','소심해 보이지만 실력은 확실하고 상냥한 마음을 소유한 수의사인 주인공이 동물들의 생명을 지키기 위해 고군분투하는 이야기를 담은 휴먼 드라마','드라마, 힐링','TV 아사히','아이바 마사키, 히로스에 료코, 오오쿠라 코지, 무라카미 준, 야시바 토시히로, 야무라 히로키, 카토 카즈코','2021-05-01 11:29:01.712929',2018),('망각.jpg','P000085','망각의 사치코','12부작','냉철한 여주인공이 결혼식 당일 신랑이 도망가게 되고, 달아난 신랑을 잊기 위해 음식을 찾아다니는 이야기를 그린 드라마','드라마, 음식','TV 도쿄','타카하타 미츠키, 사오토메 타이치, 하야마 쇼노, 아이자와 리나, 시게오카 히로시, 우에치 하루나, 후세 에리','2021-05-01 11:29:01.716918',2018),('만화.jpg','P000086','이 만화가 대단해!','12부작','만화를 실사화시킬 때 만화 캐릭터를 연기하기 위한 배우들의 과정과 도전하는 모습을 그린 다큐 드라마','다큐','TV도쿄','아오이 유우, 아라이 히로후미, 야마모토 히로시, 칸노 미스즈, 츠카모토 신야, 덴덴, 나카가와 타이시','2021-05-01 11:29:01.720718',2018),('대연애.png','P000087','대연애~나를 잊을 너와','10부작','전직 소설가이자 이삿짐센터에서 아르바이트를 하고 있는 남자와 연소성 알츠하이머에 걸린 여의사가 운명적으로 만나 펼쳐지는 순애보 러브 스토리를 담은 드라마','로맨스, 드라마','TBS','토다 에리카, 무로 츠요시, 마츠오카 마사히로, 쿠사카리 타미요, 토미자와 타케시, 스기노 요스케, 쿠로카와 토모카','2021-05-01 11:29:01.729400',2018),('이런미래.jpg','P000088','이런 미래는 들은 적 없어','10부작','후회하지 않는 삶을 살기 위해 미래를 바꾸려면 지금밖에 없다는 사실을 알게된 카요와 미래의 카요는 신노스케의 미래의 아내가 되기 위해 고군분투하는 모습을 보여준다','드라마','FOD','타나베 모모코','2021-05-01 11:29:01.733209',2018),('주재형사1.jpg','P000089','주재 형사','7부작','경시청 수사과에서 근무하던 주인공이 좌천된 후 벌이지는 이야기를 그린 드라마','드라마','TV도쿄','테라지마 스스무, 키타무라 유키야, 유민, 스즈노스케, 이치게 요시에, 쿠로키 히토미','2021-05-01 11:29:01.737458',2018),('콜드케이스2.jpg','P000090','콜드 케이스 2 ~진실의 문~','10부작','미해결 사건을 다루는 수사팀의 이야기를 그린 드라마','수사, 추리','WOWOW','미츠이시 켄, 미우라 토모카즈, 요시다 요, 나가야마 켄토, 타키토 켄이치','2021-05-01 11:29:01.742175',2018),('추첨.png','P000091','결혼 상대는 추첨으로','8부작','미혼 남녀를 대상으로 한 \'추첨 중매결혼 법\'이 시행된 가상의 일본을 무대로 현대 사회가 겪고 있는 문제들을 그린 드라마','드라마','도카이TV','노무라 슈헤이, 타카나시 린, 오타니 료헤이, 사츠카와 아이미, 와카무라 마유미','2021-05-01 11:29:01.746337',2018),('이과사랑.png','P000092','이과가 사랑에 빠졌기에 증명해 보았다','12부작','사랑의 정의를 논리적으로 증명하려는 이과 대학원생들의 러브 코미디 애니메이션','로맨스, 코미디','도쿄MX','아사카와 나나, 니시메 슌','2021-05-01 11:29:01.755404',2018),('사일런트.jpg','P000093','사일런트 보이스 행동 심리 수사관 다테오카 에마','8부작','전혀 경찰처럼 보이지 않는 형사가 취조실 안에서 범인을 몰아넣어 벌어지는 초 심리 서스펜스 드라마','서스펜스','BS 도쿄','쿠리야마 치아키, 시라스 진, 우카지 타카시, 노무라 슈이치, 시이나 카나에','2021-05-01 11:29:01.759068',2018),('도로케이.png','P000094','도로케이 -경시청 수사 3과-','10부작','가장 가까운 범죄인 절도범을 수사하는 경시청 수사 3과를 무대로 신참 형사와 금단의 콤비를 짜고 여러 가지 어려운 사건을 해결하며 성장하는 이야기를 그린 드라마','수사','NTV','나카지마 켄토, 엔도 케이치, 이시바시 안나, 나카무라 토모야, 에구치 노리코, 노마구치 토오루, 타나카 미치코','2021-05-01 11:29:01.762921',2018),('누케마이루.jpg','P000095','누케마이루~여자셋 이세참배','8부작','나이 서른을 넘긴 세 명의 여성이 사정을 안고 직장과 가정도 팽개친 채 참배를 떠나며 벌어지는 이야기를 그린 드라마','드라마','NHK','타나카 레나, 토모사카 리에, 사토 에리코, 후쿠시 세이지, 타이치 마오, 타카자와 히데아키, 타치 히로시','2021-05-01 11:29:01.766954',2018),('넘겨주지않아.jpg','P000096','당신에게는 넘겨주지 않아','7부작','평온한 일상에서 밑바닥으로 떨어진 평범한 전업주부가 이혼 신고서를 들고 나타난 남편의 애인과 정면으로 맞서기로 결심하며 벌어지는 이야기를 그린 드라마','드라마','아사히TV','기무라 요시노, 미즈노 미키, 타나카 테츠시, 하기와라 마사토, 아오야기 쇼','2021-05-01 11:29:01.771176',2018),('불혹.png','P000097','불혹의 스크럼','7부작','힘든 억압 속에서 살고 있는 중년의 남자가 우연히 40세 이상의 선수들이 모인 \"불혹 럭비\"를 만나게 되고 일본에서 개최되는 럭비월드컵을 향해가는 아버지들의 청춘 드라마','청춘','NHK','타카하시 카츠노리, 와타나베 잇케이, 무라타 타케히로, 도쿠이 유, 우에스기 쇼조, 마츠오 사토루, 타카하시 미츠오미','2021-05-01 11:29:01.775358',2018),('오사카.jpg','P000098','오사카 순환선 part4','10부작','오사카 순환선을 중심으로 사람들의 이야기를 다룬 드라마','드라마','KTV','키무라 미도리코, 나미오카 카즈키, 나카가와 코조, 미우라 마사키, 스즈키 사리나, 타니무라 미츠키, 미나카미 쿄카','2021-05-01 11:29:01.779184',2018),('삼대요리.jpg','P000099','요리 삼대째','12부작','초밥집을 운영 중인 아버지의 뒤를 이어 대를 잇기 위해 견습 요리사로 근무하는 아들이 다양한 손님들을 만나며 초밥의 세계에 빠지는 이야기를 그린 드라마','드라마','BS TOKYO','스가 켄타, 와타나베 히로유키, 사토 료, 타나카 코타로','2021-05-01 11:29:01.783037',2018),('변두리.jpg','P000100','변두리로켓','11부작','우주 과학 개발 기구 연구원이었던 주인공이 로켓 발사 실패의 책임을 지고 그만둔 후, 아버지 공장을 경영하게 되면서 생기는 이야기','드라마','TBS','아베 히로시, 츠치야 타오, 타케우치 료마, 야스다 켄, 토쿠시게 사토시, 와다 소코, 콘노 히로키','2021-05-01 11:29:01.787324',2018),('주부.png','P000101','주부 활동!','8부작','전업주부였던 주인공이 경영 부진 슈퍼마켓을 무대로 새로운 삶을 살아가는 이야기를 담은 드라마','드라마','NHK BS','스즈키 호나미, 시마자키 하루카, 오카다 요시노리, 아오야기 쇼, 이마이 유키, 야마야 카스미, 코바야시 료코','2021-05-01 11:29:01.791500',2018),('진범인.png','P000102','진범인','5부작','다른 해에 일어난 2개의 살인 사건이 교차하여 미해결 상태였던 유아 유괴 사건의 실마리를 풀어가는 수사 미스터리 드라마','미스터리, 스릴러','WOWOW','카미카와 타카야, 고이즈미 코타로, 우치다 유키, 타카시마 마사노부','2021-05-01 11:29:01.796260',2018),('오늘부터.png','P000103','오늘부터 우리는!!','10부작','주인공 콤비가 불량 학생들과 싸우거나 소동에 휘말리는 모습을 그린 청춘 코미디 드라마','코미디, 청춘','NTV','카구 켄토, 이토 켄타로, 세이노 나나, 하시모토 칸나, 나가노 타이가','2021-05-01 11:29:01.800427',2018),('심야.png','P000104','심야의 유감천만 사랑도감','10부작','세 명의 여성이 여태까지 만난 형편없는 남자들에 대해 이야기하며 펼쳐지는 드라마','드라마','TV 아사히','바바 후미카, 사노 히나코, 히사마츠 이쿠미, 세토 토시키, 키요하라 쇼','2021-05-01 11:29:01.804368',2018),('엔도켄이치와.jpg','P000105','엔도 켄이치와 쿠도 칸쿠로의 공부하겠습니다','7부작','형사가 연쇄 살인범을 쫓는 서스펜스 드라마의 촬영 현장에서 트러블 발생으로 임시로 현장에 있던 다른 명배우들이 다시 찍게 되며 벌어지는 이야기를 그린 드라마','드라마','WOWOW','엔도 켄이치, 오구리 슌, 나카 리이사, 카토 료, 타카하타 아츠코, 노무라 슈헤이, 미즈노 미키','2021-05-01 11:29:01.807901',2018),('판도라.png','P000106','판도라 4 : ai 전쟁','6부작','기술의 진보로 인해 AI가 사회에 어떤 영향을 미치는지 생생하게 그린 드라마','SF,공상','WOWOW','무카이 오사무, 쿠로키 히토미, 미무라 리에, 미우라 타카히로, 야마모토 코지, 하라다 타이조, 와타베 아츠로','2021-05-01 11:29:01.812961',2018),('다이어리.jpg','P000107','다이어리','4부작','시간을 초월한 여자들의 사랑과 정을 따뜻하게 그린 감동의 휴먼 스토리 드라마','드라마','NHK BS','렌부츠 미사코, 키쿠치 모모코, 나카무라 아오이, 오츠카 네네, 하마다 마리, 니시다 나오미, 아사미 치유키','2021-05-01 11:29:01.816863',2018),('우울.jpg','P000108','우쯔누케','6부작','모두가 남의 일 수없는 지금, 거기에있는 위기 \"우울증 (우울증)\"을 테마로 한 이색 드라마. 타나카 케이이치는 자신도 우울증 탈출 경험 ( \"우쯔누케\")를 가진 만화가. 그 경험을 살려, 우울증 누케 경험자의 에피소드를 전혀 \"우울증\"과는 무관 조수 · 가네코 함께 당사자와 함께 되돌아 보는 것을 시작했다.','드라마','hulu','타나카 나오키, 오고 스즈카','2021-05-01 11:29:01.820789',2018),('절대영도_미연.jpg','P000109','절대영도 ~미연범죄잠입수사~','10부작','경시청 내에 신설된 특명수사 대책실을 배경으로 하는 드라마','수사','TV','사와무라 잇키, 요코야마 유, 혼다 츠바사, 에모토 토키오, 마기, 다나카 미치코, 나카무라 이쿠지','2021-05-01 11:29:01.824373',2018),('도쿄에일리언.jpg','P000110','도쿄 에일리언 브라더스','10부작','지구 이주 계획을 목적으로 현지 조사차 지구에 살고 있는 외계인 형제가 도쿄를 탐방하거나 인간과 교류하는 모습을 그린 드라마','드라마','NTV','이노오 케이, 토츠카 쇼타, 츠네마츠 유리, 오고 스즈카, 오와다 켄스케','2021-05-01 11:29:01.827924',2018);
/*!40000 ALTER TABLE `jpdrama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(10) NOT NULL,
  `gender` varchar(4) DEFAULT NULL,
  `birth` varchar(10) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `address` varchar(90) NOT NULL,
  `regist_day` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail` (`mail`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('abcde','fGkSh8DbUkumRYUxvKpOVg==','test','남자','2021-04-28','abcde@ruu.kr','010-1234-4123','01093/서울 강북구 덕릉로 1 (수유동, 석경빌딩)/1234','2021-05-17'),('admin','WXBJvD8GLjG7Vbinlm2IOQ==','젤리','남자','2021-03-04','admin@naver.com','010-1234-5678','서울/a/a','2021-03-04'),('fkfkljg','2rdTds/4rmuhBMQhqwxPuw==','zzzz','기타','0012-12-12','qkrrudals2403@naver.com','010-1234-1234','46729/부산 강서구 가달1로 7 (생곡동)/ㅎㅎㅎㅎ','2021-05-25'),('Message','OfQp+v4GdFBTBmT1ib5cVQ==','Message','기타','2021-05-18','miyamotomina686@gmail.com','010-1111-2222','48060/부산 해운대구 우동 1500/1','2021-05-18'),('mina0502','kpKkrk5HcvvcXyw3JgIPAg==','mina','남자','2021-05-25','test003@ruu.kr','010-1111-1112','06281/서울 강남구 남부순환로 2907 (대치동, 대치지구대)/주소','2021-05-25'),('test','2rdTds/4rmuhBMQhqwxPuw==','test','남자','2021-03-30','test001@ruu.kr','010-4231-1234','48060/부산 해운대구 APEC로 30 (우동, 벡스코제2전시장)/adada','2021-04-30'),('test1','MA4+dszs7jmpS2P7Zdm9wA==','test','남자','2021-04-28','test004@ruu.kr','010-1111-1111','06063/서울 강남구 도산대로70길 25 (청담동, 청담2차 e편한세상아파트)/sadsa','2021-05-24');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rvdrama`
--

DROP TABLE IF EXISTS `rvdrama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rvdrama` (
  `num` int NOT NULL,
  `id` varchar(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `view` int DEFAULT NULL,
  `repl` int DEFAULT NULL,
  `starinput` float DEFAULT NULL,
  `pagenum` int DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `id` (`id`),
  CONSTRAINT `rvdrama_ibfk_1` FOREIGN KEY (`id`) REFERENCES `members` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rvdrama`
--

LOCK TABLES `rvdrama` WRITE;
/*!40000 ALTER TABLE `rvdrama` DISABLE KEYS */;
INSERT INTO `rvdrama` VALUES (1,'test','오늘부터 우리는!!','겁나 재밌음 ㅋㅋ','2021-05-18',20,0,5,0),(2,'admin','오늘부터 우리는!!','저도 재밌게 봤어요 ㅎㅎ~\r\n','2021-05-18',NULL,3,NULL,1),(3,'abcde','오늘부터 우리는!!','약간 폭력물인게 아쉬웠어요','2021-05-18',NULL,2,NULL,1),(4,'test1','반상의 알파~약속의 장기~','꽤나 괜찮아요','2021-05-24',8,0,4.5,0),(5,'test1','반상의 알파~약속의 장기~','ㅊㅋㅊㅋ','2021-05-24',NULL,1,NULL,4),(6,'mina0502','프리티가 너무 많아','볼만해요','2021-05-25',5,0,4,6),(7,'admin','반상의 알파~약속의 장기~','정말 괜찮았던거 같아요','2021-05-25',NULL,1,NULL,4),(8,'test','심야의 유감천만 사랑도감','심심풀이로 딱이예여','2021-05-25',NULL,0,4.5,0),(9,'test','심야의 유감천만 사랑도감','2021-05-25','2021-05-25',NULL,1,NULL,8),(10,'test','절대영도 ~미연범죄잠입수사~','뭔가 아쉬움이 남았어여','2021-05-25',0,0,2.5,0);
/*!40000 ALTER TABLE `rvdrama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wish`
--

DROP TABLE IF EXISTS `wish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wish` (
  `num` int NOT NULL AUTO_INCREMENT,
  `l_id` varchar(10) DEFAULT NULL,
  `p_id` varchar(200) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `l_id` (`l_id`),
  CONSTRAINT `wish_ibfk_1` FOREIGN KEY (`l_id`) REFERENCES `members` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish`
--

LOCK TABLES `wish` WRITE;
/*!40000 ALTER TABLE `wish` DISABLE KEYS */;
/*!40000 ALTER TABLE `wish` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-25 23:18:36