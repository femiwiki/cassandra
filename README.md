Cassandra [![Docker Hub Status]][Docker Hub Link]
========

기본적으로 인증을 요구하도록 변형된 [Cassandra] 도커 이미지.

```bash
docker run --name some-cassandra -d femiwiki/cassandra
# 카산드라가 켜지는 만큼 시간이 지난 후에
docker container logs some-cassandra 2>&1 | tail -n 2
# OUTPUT: Generated admin(superuser)'s password: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# OUTPUT: Generated femiwiki's password: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
docker exec some-cassandra \
  cqlsh -u femiwiki -p xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -e "SHOW HOST;"
# OUTPUT: Connected to Test Cluster at 127.0.0.1:9042.
```

계정
--------

실행 시 데이터베이스가 초기화되면서 다음 계정이 생성됩니다.

이름 | 슈퍼유저 | 비밀번호 | 로그인
-|-|-|-
`admin` | yes | 자동 생성됨 | 가능
환경변수 `USER_NAME` | no | 자동 생성됨 | 가능
~~`cassandra`~~<br/>기본 슈퍼유저 | ~~yes~~ | ~~`cassandra`~~ | 불가

비밀번호는 무작위한 값으로 자동 생성되어 로그로 출력되며 위 예제에서처럼 확일할 수 있습니다.

환경 변수
--------

| 이름 | 기본값 | 설명 |
--|--|--
USER_NAME | femiwiki | 슈퍼유저가 아니도록 생성할 유저의 이름.
DEV_PASSWORD | (없음) | 슈퍼유저가 아니도록 생성할 유저의 비밀번호, 생략할 경우 자동으로 생성됨.

DEV_PASSWORD는 개발 시 비밀번호를 간단한 것으로 지정하고 싶을 경우를 위한 변수이며 프로덕션 시에는 사용하지 말아주세요.

&nbsp;

--------

The source code of *femiwiki/cassandra* is primarily distributed under the terms
of the [GNU Affero General Public License v3.0] or any later version. See
[COPYRIGHT] for details.

[Docker Hub Status]: https://badgen.net/docker/pulls/femiwiki/cassandra/?icon=docker&label=pulls
[Docker Hub Link]: https://hub.docker.com/r/femiwiki/cassandra/
[Cassandra]: http://cassandra.apache.org/
[GNU Affero General Public License v3.0]: LICENSE
[COPYRIGHT]: COPYRIGHT
