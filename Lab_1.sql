---LAB-1-----PART-A---

--1
SELECT DISTINCT GENRE FROM SONGS

--2
SELECT TOP 2 ALBUM_TITLE FROM ALBUMS WHERE RELEASE_YEAR <2010

--3
INSERT INTO SONGS VALUES(1245,'ZAROOR',2.55,'FEEL GOOD',1005)

--4
UPDATE SONGS SET GENRE='HAPPY' WHERE SONG_TITLE='ZAROOR'

--5
delete from Artists where Artist_name='Ed Sheeran'
--6
ALTER TABLE Songs ADD Ratings DECIMAL(3,2)

--7
SELECT Song_title from Songs where Song_title like 's%'

--8
SELECT Song_title from Songs where Song_title like 'Everybody%'

--9
SELECT UPPER(Artist_name) as uppercase from Artists

--10
select SQRT(3.55)

--11
select GETDATE()

--12
SELECT ARTIST_ID,COUNT(ALBUM_TITLE) AS TOTAL_ALBUMS FROM ALBUMS GROUP BY ARTIST_ID;

--13
SELECT ALBUM_ID,COUNT(SONG_ID) AS NOOFSONGS FROM SONGS GROUP BY ALBUM_ID HAVING COUNT(ALBUM_ID)>3;

--14
select Song_title from Songs where Album_id=(select Album_id from Albums where Album_title='Album1')

--15
select Album_title from Albums where Artist_id=(select Artist_id from Artists where Artist_name='Aparshakti Khurana')

--16
select a.Album_title,s.Song_title from Albums a join Songs s on a.Album_id=s.Album_id  

--17
select s.Song_title from Albums a join Songs s on a.Album_id=s.Album_id where a.Release_year='2020'

--18
create view Fav_song as select Song_id,Song_title,Duration,Genre,Album_id from Songs where Song_id<=105

--19
update Fav_song set Song_title='Jannat' where Song_id='101'
select * from Fav_song

--20
select Artists.Artist_name,Albums.Album_title,Albums.Release_year from Artists join Albums on Artists.Artist_id=Albums.Artist_id where Albums.Release_year='2020'

--21
select Artists.Artist_name,Songs.Duration,Songs.Song_title 
from Artists  join Albums on Artists.Artist_id=Albums.Artist_id 
join Songs on Albums.Album_id=Songs.Album_id 
where Artists.Artist_name='Shreya Ghoshal'
order by Songs.Duration 

