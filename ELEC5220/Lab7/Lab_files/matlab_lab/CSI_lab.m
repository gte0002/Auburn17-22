clear
close all
cells = read_bf_file('lab_data');
m=180;K =800;N=30;
amplitude1 = zeros(1, K);
amplitude2 = zeros(1, K);
amplitude3 = zeros(1, K);
relative_phase12 = zeros(1, K);
relative_phase23 = zeros(1, K);
relative_phase31 = zeros(1, K);
t=zeros(1,K);
sum_amp=zeros(N,K);
sum_phase=zeros(N,K);
count = 1;
%  figure
for id=1:30 
  for i = m+1 :  m+K
	csi = cells{i}.csi;
     
	csi1 = reshape(csi(1,1, :), 1, N);
	csi2 = reshape(csi(1,2, :), 1, N);
	csi3 = reshape(csi(1,3, :), 1, N);
    
	
	amplitude1(count) =abs(csi1(id));
	amplitude2(count) =abs(csi2(id));
	amplitude3(count) =abs(csi3(id));
	
   relative_phase12(count) =angle(csi2(id)*conj(csi1(id)));
    relative_phase23(count) =angle(csi3(id)*conj(csi2(id)) );
	relative_phase31(count) =angle(csi1(id)*conj(csi3(id)));
	count = count + 1;
 end
count=1;

rp1= relative_phase12;
rp2=relative_phase23;
rp3=relative_phase31;

%%amplitude extraction
y2=amplitude1; 
sum_amp(id,:)=y2;

%%% phase value extraction
p1=unwrap(rp2);
y2=p1; 
n=length(y2);
sum_phase(id,:)=y2;
end

%% plot channel state information in polar coordinates for one packet 
figure
csi_data=csi1;
theta=angle(csi_data);
rho= abs(csi_data);
polarplot(theta,rho,'*') %plot CSI for all 30 subcarriers
title('CSI in polar coordinates')

%% Image the channel state information for multiple packets
select_data=sum_amp; %% use "sum_amp" or "sum_phase" to select amplitude value or phase difference value
figure
scale=max(select_data(:))-min(select_data(:));
imagedata=512*(select_data-min(select_data(:)))/scale; %%normalize the data for image
image(imagedata)
colormap jet
xlabel('Packet Index');
ylabel('Subcarrier Index');
title('CSI variation for 30 subscarriers')