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


---Part B
--22
Select Song_title
from Songs
where Album_id in (Select Album_id
					from Albums
					where Artist_id in (select Artist_id
										from Albums
										group by Artist_id
										having count(Album_title) > 1 ));

--23
SELECT ALBUMS.ALBUM_TITLE,COUNT(SONGS.SONG_TITLE) AS TOTALSONGS 
FROM ALBUMS JOIN SONGS
ON ALBUMS.ALBUM_ID=SONGS.ALBUM_ID
GROUP BY ALBUM_TITLE;

--24
SELECT SONGS.SONG_TITLE,ALBUMS.RELEASE_YEAR
FROM ALBUMS JOIN SONGS
ON ALBUMS.ALBUM_ID=SONGS.ALBUM_ID
ORDER BY RELEASE_YEAR;

--25
SELECT GENRE,COUNT(SONG_TITLE) AS MORETHAN2SONGS
FROM SONGS
GROUP BY GENRE
HAVING COUNT(SONG_TITLE)>2;

--26
SELECT ARTISTS.ARTIST_NAME,COUNT(SONGS.SONG_TITLE)
FROM ARTISTS JOIN ALBUMS
ON ARTISTS.ARTIST_ID=ALBUMS.ARTIST_ID
JOIN SONGS ON ALBUMS.ALBUM_ID=SONGS.ALBUM_ID
GROUP BY ARTIST_NAME
HAVING COUNT(SONGS.SONG_TITLE)>3;

---part c

--27
select Album_title
from Albums
where Release_year in (Select Release_year
						from Albums
						where Album_title = 'Album4');

--28
SELECT GENRE,MAX(DURATION)
FROM SONGS
GROUP BY GENRE;

--29
select Songs.Song_title, Albums.Album_title
from Albums join Songs on Albums.Album_id = Songs.Album_id
where Albums.Album_title like '%Album%';

--30
select Artists.Artist_name ,sum(Songs.Duration)
from Artists join Albums on Artists.Artist_id = Albums.Artist_id join Songs on Albums.Album_id = Songs.Album_id
group by Artists.Artist_name
having sum(Duration) > 15;

