# 2020-jsp-crud-2
## 2020년도 2학기 jsp crud 프로젝트 2번째 평가 mvc2 구조를 사용해서 만드는 시스템

- 먼저 실행하기 전에 severs에 modules에 들어가서 서버의 Path를 '/'로 바꿔주세요
- 집의 JRE System Library 는 jdk-14.0.2라서 학교의 경우 변경 해주세요
- alert 창의 경우 chrome 에서 실행 해주시면 감사하겠습니다

## 기능 만들었던 순서대로
### insert 구조 

1. 입력 형식이 있는 insertBook.jsp 에 가서 보여주고  입력을 받으면 BookInsertController로 보내진다.
2. /BookInsert.do라는 주소로 BookInsertController에 있는 doProcess에서 처리되며 받은 값들을 vo 형식으로 만든 뒤 dao에 있는 insertBoard라는 곳으로 보내고 리턴을 받는다.
3. 받은 값이 0보다 크다면 성공이므로 ok라는 메시지를 아니라면 error라는 메시지를 다시 insertBook.jsp로 보내고  insertBook.jsp에서 이에 맞게 이동 시킨다.
4. 성공 = BookList.do(도서 목록 페이지) 실패 = 다시 insert 폼 나오게 된다 

### list 구조
1. 바로 selectBook.jsp로 보내는것이 아니고 BookListController로 보내는 것이다.
2. /BookList.do라는 주소로 BookListController에 있는 doProcess에서 처리되며 dao에 있는 getList를 사용해서 리스트를 만든다 
3. 만들어진 리스트를 request에 "list"라는 이름에 list를 저장 하며 selectBook.jsp 로 보낸다 
4. selectBook.jsp에서는  list를 getAttribute로 받고 list를 for문으로 돌아서 각각의 데이터를 출력해준다 
5. bpub 데이터 같은 경우에는 값에 따라 출판사 이름이 바뀌기 때문에 switch를 사용해서 출력해줬고 가격은 3자리마다 콤마를 찍기위해 DecimalFormat함수를 사용해서 출력 
6. 날짜 형식은 yyyy년MM월dd일 이라는 형식으로 보여주기 위해서 SimpleDateFormat함수를 사용해서 바꿔줬당

### update 구조
1. updateBook.jsp?bcode=수정할 책의 bcode로 이동한다
2. updateBook.jsp에서 BookUpdateController로 bcode를 보낸다. /BookUpdate
3. BookUpdateController에서 받은 bcode로 dao에 findUser를 통해서 그 번호의 사용자를 찾는다
4. 찾은 사용자의 정보를 vo에 담아서 다시 updateBook.jsp 
5. 수정된 정보를 다시 BookUpdateController에서 받아서 dao에 updateBoard를 사용해서 업데이트한다
6. update되면 /BookList.do로 이동 

### delete 구조
1. deleteBook.jsp 에 bcode를 담아서 이동
2. confirm으로 삭제할지 결정을 받고 삭제한다면 /BookDelete.do에 보내서 삭제 시킴 
3. 삭제가 성공할 경우 ok를 실패한 경우 error를 deleteBook.jsp로 보내서 확인 
4. delete되면 /BookList.do로 이동 

도서 시스템
======
![book](https://user-images.githubusercontent.com/55534787/98819370-1e67fa80-2470-11eb-9d55-a7957437b814.png)
