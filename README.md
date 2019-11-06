# Cassandra [![Docker Hub Status]][docker hub link]

# :warning: CAUTION! This repository/Docker image is not maintained! 

기본적으로 인증을 요구하도록 변형된 [Cassandra] 도커 이미지.

```bash
# 도커 콘테이너 구동
$ docker run --name some-cassandra -d femiwiki/cassandra

# 카산드라가 시작하기까지 잠시 기다립니다.

# 자동으로 생성된 비밀번호 조회
$ docker container logs some-cassandra 2>&1 | tail -n 2
# 출력: Generated admin(superuser)'s password: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# 출력: Generated femiwiki's password: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

# 접속 및 쿼리 시험
$ docker exec some-cassandra \
  cqlsh -u femiwiki -p xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -e "SHOW HOST;"
# 출력: Connected to Test Cluster at 127.0.0.1:9042.
```

## 계정

실행 시 데이터베이스가 초기화되면서 다음 계정이 생성됩니다. 비밀번호는 무작위한 값으로 자동 생성되어 로그로 출력되며 위에 표시된 것과 같은 방법으로 확일할 수 있습니다.

| 이름                              | 슈퍼유저 | 비밀번호        | 로그인 |
| --------------------------------- | -------- | --------------- | ------ |
| `admin`                           | yes      | 자동 생성됨     | 가능   |
| 환경변수 `USER_NAME`              | no       | 자동 생성됨     | 가능   |
| ~~`cassandra`~~<br/>기본 슈퍼유저 | ~~yes~~  | ~~`cassandra`~~ | 불가   |

## 환경 변수

| 이름         | 기본값   | 설명                                                                     |
| ------------ | -------- | ------------------------------------------------------------------------ |
| USER_NAME    | femiwiki | 슈퍼유저가 아니도록 생성할 유저의 이름.                                  |
| DEV_PASSWORD | (없음)   | 슈퍼유저가 아니도록 생성할 유저의 비밀번호, 생략할 경우 자동으로 생성됨. |

DEV_PASSWORD는 개발 시 비밀번호를 간단한 것으로 지정하고 싶을 경우를 위한 변수이며 프로덕션 시에는 사용하지 말아주세요.

&nbsp;

---

The source code of _femiwiki/cassandra_ is primarily distributed under the terms
of the [GNU Affero General Public License v3.0] or any later version. See
[COPYRIGHT] for details.

[docker hub status]: https://badgen.net/docker/pulls/femiwiki/cassandra/?icon=docker&label=pulls
[docker hub link]: https://hub.docker.com/r/femiwiki/cassandra/
[cassandra]: http://cassandra.apache.org/
[gnu affero general public license v3.0]: LICENSE
[copyright]: COPYRIGHT
