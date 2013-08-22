Scale Ratio ICP for 3D Point Clouds with Different Scales, IEEE International Conference on Image Processing (ICIP2013), September 15-18, 2013, Melbourne, Australia
https://github.com/linbaowei/ScaleRatioICP
Baowei Lin, Toru Tamaki, Bisser Raytchev, Kazufumi Kaneda, Koji Ichii (Hiroshima University)
Contact address: lin-bao-wei@hotmail.com
===================================================================







* What can you get
-------------------------------------------------------------------
	In this paper we propose a method for matching the scales of 3D point clouds. 3D point sets of the same scene obtained by 3D reconstruction techniques usually differ in scale. To match scales, we estimate the ratio of scales of two given 3D point clouds. By performing PCA of spin images over different scales of two point clouds, two sets of cumulative contribution rate curves are generated. Such sets of curves can be considered to characterize the scale of the given 3D point clouds. To find the scale ratio of two point clouds, we register the two sets of curves by using a variant of ICP that estimates
the ratio of scales.	
	If you download the files for the proposed method and uncompress is, there are 2 folders as follows:
		1. folder ContributionRateGeneration		//C++ project for generating contribution Rate
		2. folder Scale_Ratio_ICP			//Matlab project for estimating scale ratio of two point clouds
	They are explained in following parts.











* Requirements
-------------------------------------------------------------------
	for ContributionRateGeneration:
		1. OpenCV 2.4.0
		2. PCL 1.6

	for Scale_Ratio_ICP:
		1. contribution rate files 








* How to implement Scale Ratio ICP method
-------------------------------------------------------------------
	In order to implement scale ratio ICP method, contribution rates of the spin images of the 3D points must be provided.  
	First we explain how to use contribution rate generation method. (The details please refer to Tamaki et al., "Scale matching of 3D point clouds by finding keyscales with spin images", in ICPR, 2010, pp. 3480-3483.)
		usage:
		---------------------------------------------------
			./scalesextract [intput1.ply] [intput2.ply] [bin]			//input.ply : ply files with points and normals.
													//bin : bin size in spin-image (real bin is bin^2 in this program).
		Example:
		--------------------------------------------------- 
			./scalesextract pointoneseg.ply pointtwoseg.ply 12

		
		what you can get
		---------------------------------------------------
			with inputted ply files, you can get two generated files named 'input.ply.cdw' and 'input.ply.eig'. '*.cdw' file is used to save contribution rate. It will be provided to scale ratio ICP method. The format of '*.cdw' file is: 
						line 1:  [spin image width1 (mesh resolution*1)]    [contribution rate 1] ... [contribution rate 144]
						line 2:  [spin image width2 (mesh resolution*2)]    [contribution rate 1] ... [contribution rate 144]
											.
											.
											.
						line 11: [spin image width1 (mesh resolution*10*1)] [contribution rate 1] ... [contribution rate 144]
						line 12: [spin image width2 (mesh resolution*10*2)] [contribution rate 1] ... [contribution rate 144]
											.
											.
											.
						line 21: [spin image width1 (mesh resolution*100*1)] [contribution rate 1] ... [contribution rate 144]
						line 22: [spin image width2 (mesh resolution*100*2)] [contribution rate 1] ... [contribution rate 144]
											.
											.	
											.
						line 29: [spin image width1 (mesh resolution*100*9)] [contribution rate 1] ... [contribution rate 144]
						line 30: [spin image width2 (mesh resolution*100*10)] [contribution rate 1] ... [contribution rate 144]
			'*.eig' file is used to save eigenvalues of vectorized spin images. It has no future use.




		How to compile ContributionRateGeneration project
		---------------------------------------------------
			in order to compile Contribution rate project, at least, OpenCV 2.4.0 and PCL 1.6 are necessary.
			bash-4.2$  cd /ContributionRateGeneration	//depand on where you save our provided files, please entrance this folder in advance
			bash-4.2$  mkdir build
			bash-4.2$  cd build
			bash-4.2$  cmake ..
			bash-4.2$  make
			bash-4.2$  cp ../data/*.ply ./
			bash-4.2$  ./scalesextract pointoneseg.ply pointtwoseg.ply 12

	

	
	Next, we explain how to use scale ratio ICP method. This method is implemented with Matlab. You need copy '*.cdw' files of two point clouds to the folder of 'ScaleRatioICP', then launch Matlab. In the command line of Matlab: 
		usage:
		-------------------------------------------------
			ScaleRatioICP('pointoneseg.ply.cdw', 'pointtwoseg.ply.cdw', 200)	

			The inputs for function ScaleRatioICP are: *.cdw file of point cloud 1, *.cdw file of point cloud 2, and iteration number.


	






* License: MIT
--------------------------------------------------------------------

/*
 *   Copyright (c) 2013 <Baowei Lin> <lin-bao-wei@hotmail.com>
 * 
 *   Permission is hereby granted, free of charge, to any person
 *   obtaining a copy of this software and associated documentation
 *   files (the "Software"), to deal in the Software without
 *   restriction, including without limitation the rights to use,
 *   copy, modify, merge, publish, distribute, sublicense, and/or sell
 *   copies of the Software, and to permit persons to whom the
 *   Software is furnished to do so, subject to the following
 *   conditions:
 * 
 *   The above copyright notice and this permission notice shall be
 *   included in all copies or substantial portions of the Software.
 * 
 *   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 *   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 *   OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 *   NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 *   HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 *   WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 *   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 *   OTHER DEALINGS IN THE SOFTWARE.
 */



We kindly ask for users to refer
T. Tamaki, S. Tanigawa, Y. Ueno, B. Raytchev, K. Kaneda, "Scale matching of 3D point clouds by finding keyscales with spin images", in ICPR2010, pp. 3480-3483 (2010).
Baowei Lin, Toru Tamaki, Marcos Slomp, Bisser Raytchev, Kazufumi Kaneda, Koji Ichii: 3D Keypoints Detection from a 3D Point Cloud for Real-Time Camera Tracking, IEEJ Transactions on Electronics, Information and Systems, Vol. 133, No. 1, pp.84-90 (2013).
in your paper published by using our implementation. Thank you!




* Acknowledgements
One dataset used in this demonstration is taken from the following website:
- The Stanford Bunny, Stanford University Computer Graphics Laboratory, The Stanford 3D Scanning Repository.
  http://graphics.stanford.edu/data/3Dscanrep/



