import 'package:gihubflutter/generated/json/base/json_convert_content.dart';

class InfoListsEntity with JsonConvert<InfoListsEntity> {
	InfoListsData data;
	int errorCode;
	String errorMsg;
}

class InfoListsData with JsonConvert<InfoListsData> {
	int curPage;
	List<InfoListsDataData> datas;
	int offset;
	bool over;
	int pageCount;
	int size;
	int total;
}

class InfoListsDataData with JsonConvert<InfoListsDataData> {
	String apkLink;
	int audit;
	String author;
	bool canEdit;
	int chapterId;
	String chapterName;
	bool collect;
	int courseId;
	String desc;
	String descMd;
	String envelopePic;
	bool fresh;
	int id;
	String link;
	String niceDate;
	String niceShareDate;
	String origin;
	String prefix;
	String projectLink;
	int publishTime;
	int realSuperChapterId;
	int selfVisible;
	int shareDate;
	String shareUser;
	int superChapterId;
	String superChapterName;
	List<dynamic> tags;
	String title;
	int type;
	int userId;
	int visible;
	int zan;
}
