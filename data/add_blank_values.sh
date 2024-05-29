#!/bin/bash

# Script for adding blank values for people with missing clinical data
arr=(3905023 4027059 4334250 5654570 4536298 4129473 5303011 5637061 5664800 5499280 4629712 4146654 5622696 5049037 4970156 5829455 4991733 5361395 4225491 4878218 4697378 5232112 5682380 4289678 5745164 4153604 5911519 3835714 5730151 4179357 5020825 4157270 4238160 5094380 4782940 4566772 4023434 5465986 4933862 5296585 4453377 4797991 5800402 5897554 5369217 4058015 4511503 5063190 3957269 4452673 5391866 3943083 5929681 4549909 5254983 5517013 5295388 5866913 5515501 5536819 4546601 4926726 5847596 5928303 5488049 4170592 3867356 5973130 5543680 3908285 5206426 5602256 4397048 4389404 4316252 3872882 4765708 4575862 5114472 5631157 5741528 5987260 4643060 4642805 4986234 6007064 4216076 4585843 4867292 5083017 5044164 5327438 4481378 5593499 5890708 4276870 5146128 4852811 4375204 5282177 4733938 3966480 4885640 4214722 4948273 5934460 3871283 5442304 5156599 5817017 4596528 4367759 5823620 5731735 5718418 5100531 6015594 4477818 6003434 3834747 4584057 4281504 4523477 4528827 5154041 4513444 4843960 4871828 5055306 5896701 4052688 5790471 5748308 5709156 4874698 4312072 4298997 4838805 4094943 6014341)

for i in ${arr[@]} ; do
 #echo $i
 sqlite3 ukb40183.db << EOF
 SELECT eid FROM clinicaldata
 WHERE eid = "$i";
 UPDATE clinicaldata SET visit = "0"
 WHERE eid = "$i";
EOF
done

