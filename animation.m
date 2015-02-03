clear,clc
filename = 'wave.avi';%filename of the file that will be written
movie = VideoWriter(filename,'Motion JPEG AVI');%make the movie object
open(movie);%so i am able to write the movie to the file
x = 0:.05:1;%define edges of the wave
y = 0:.05:.75;%edges of the wave
frequency = 1.5;%how fast the wave moves
[X Y] = meshgrid(x,y);%make a matrix from the vector
time = 0:.05:20;%amount of time and resolution to loop through

for i=1:1:length(time)
    Z = cos(frequency.*time(i)).*sin(3.*pi.*X).*sin((3.*pi./(.75)).*Y);%long equation to write out the wave
    surf(X,Y,Z);
    axis([0 1 0 1 -1 1])%define the camera axis [xmin xmax ymin ymax zmin zmax]
    frame = getframe;
    writeVideo(movie,frame);%write each frame to the movie object
end
%write movie
close(movie);%acuatally write the data to disk
