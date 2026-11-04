import React from 'react';
import {Composition, Folder, Series, useVideoConfig} from 'remotion';
import {Slide01} from './Slide01';
import {Slide02} from './Slide02';
import {Slide03} from './Slide03';
import {Slide04} from './Slide04';
import {Slide05} from './Slide05';
import {Slide06} from './Slide06';
import {Slide07} from './Slide07';
import {Slide08} from './Slide08';
import {Slide09} from './Slide09';
import {Slide10} from './Slide10';
import {Slide11} from './Slide11';
import {Slide12} from './Slide12';
import {Slide13} from './Slide13';
import {Slide14} from './Slide14';
import {Slide15} from './Slide15';
const Classroom90: React.FC = () => {
const {fps} = useVideoConfig();
return <Series>
<Series.Sequence name="Slide 01" durationInFrames={7200} premountFor={fps}><Slide01/></Series.Sequence>
<Series.Sequence name="Slide 02" durationInFrames={14400} premountFor={fps}><Slide02/></Series.Sequence>
<Series.Sequence name="Slide 03" durationInFrames={18000} premountFor={fps}><Slide03/></Series.Sequence>
<Series.Sequence name="Slide 04" durationInFrames={14400} premountFor={fps}><Slide04/></Series.Sequence>
<Series.Sequence name="Slide 05" durationInFrames={7200} premountFor={fps}><Slide05/></Series.Sequence>
<Series.Sequence name="Slide 06" durationInFrames={10800} premountFor={fps}><Slide06/></Series.Sequence>
<Series.Sequence name="Slide 07" durationInFrames={21600} premountFor={fps}><Slide07/></Series.Sequence>
<Series.Sequence name="Slide 08" durationInFrames={7200} premountFor={fps}><Slide08/></Series.Sequence>
<Series.Sequence name="Slide 09" durationInFrames={14400} premountFor={fps}><Slide09/></Series.Sequence>
<Series.Sequence name="Slide 10" durationInFrames={7200} premountFor={fps}><Slide10/></Series.Sequence>
<Series.Sequence name="Slide 11" durationInFrames={14400} premountFor={fps}><Slide11/></Series.Sequence>
<Series.Sequence name="Slide 12" durationInFrames={1800} premountFor={fps}><Slide12/></Series.Sequence>
<Series.Sequence name="Slide 13" durationInFrames={1800} premountFor={fps}><Slide13/></Series.Sequence>
<Series.Sequence name="Slide 14" durationInFrames={12600} premountFor={fps}><Slide14/></Series.Sequence>
<Series.Sequence name="Slide 15" durationInFrames={9000} premountFor={fps}><Slide15/></Series.Sequence>
</Series>;
};
const NarrationOnly: React.FC = () => {
const {fps} = useVideoConfig();
return <Series>
<Series.Sequence name="Slide 01" durationInFrames={3166} premountFor={fps}><Slide01/></Series.Sequence>
<Series.Sequence name="Slide 02" durationInFrames={4004} premountFor={fps}><Slide02/></Series.Sequence>
<Series.Sequence name="Slide 03" durationInFrames={4316} premountFor={fps}><Slide03/></Series.Sequence>
<Series.Sequence name="Slide 04" durationInFrames={3793} premountFor={fps}><Slide04/></Series.Sequence>
<Series.Sequence name="Slide 05" durationInFrames={3314} premountFor={fps}><Slide05/></Series.Sequence>
<Series.Sequence name="Slide 06" durationInFrames={3908} premountFor={fps}><Slide06/></Series.Sequence>
<Series.Sequence name="Slide 07" durationInFrames={4846} premountFor={fps}><Slide07/></Series.Sequence>
<Series.Sequence name="Slide 08" durationInFrames={3080} premountFor={fps}><Slide08/></Series.Sequence>
<Series.Sequence name="Slide 09" durationInFrames={4348} premountFor={fps}><Slide09/></Series.Sequence>
<Series.Sequence name="Slide 10" durationInFrames={3104} premountFor={fps}><Slide10/></Series.Sequence>
<Series.Sequence name="Slide 11" durationInFrames={4373} premountFor={fps}><Slide11/></Series.Sequence>
<Series.Sequence name="Slide 12" durationInFrames={1370} premountFor={fps}><Slide12/></Series.Sequence>
<Series.Sequence name="Slide 13" durationInFrames={1369} premountFor={fps}><Slide13/></Series.Sequence>
<Series.Sequence name="Slide 14" durationInFrames={4838} premountFor={fps}><Slide14/></Series.Sequence>
<Series.Sequence name="Slide 15" durationInFrames={4388} premountFor={fps}><Slide15/></Series.Sequence>
</Series>;
};
export const RemotionRoot: React.FC = () => <>
<Composition id="Classroom90" component={Classroom90} width={1920} height={1080} fps={30} durationInFrames={162000}/>
<Composition id="NarrationOnly" component={NarrationOnly} width={1920} height={1080} fps={30} durationInFrames={54217}/>
<Folder name="Slide-chapters">
<Composition id="Slide01" component={Slide01} width={1920} height={1080} fps={30} durationInFrames={3166}/>
<Composition id="Slide02" component={Slide02} width={1920} height={1080} fps={30} durationInFrames={4004}/>
<Composition id="Slide03" component={Slide03} width={1920} height={1080} fps={30} durationInFrames={4316}/>
<Composition id="Slide04" component={Slide04} width={1920} height={1080} fps={30} durationInFrames={3793}/>
<Composition id="Slide05" component={Slide05} width={1920} height={1080} fps={30} durationInFrames={3314}/>
<Composition id="Slide06" component={Slide06} width={1920} height={1080} fps={30} durationInFrames={3908}/>
<Composition id="Slide07" component={Slide07} width={1920} height={1080} fps={30} durationInFrames={4846}/>
<Composition id="Slide08" component={Slide08} width={1920} height={1080} fps={30} durationInFrames={3080}/>
<Composition id="Slide09" component={Slide09} width={1920} height={1080} fps={30} durationInFrames={4348}/>
<Composition id="Slide10" component={Slide10} width={1920} height={1080} fps={30} durationInFrames={3104}/>
<Composition id="Slide11" component={Slide11} width={1920} height={1080} fps={30} durationInFrames={4373}/>
<Composition id="Slide12" component={Slide12} width={1920} height={1080} fps={30} durationInFrames={1370}/>
<Composition id="Slide13" component={Slide13} width={1920} height={1080} fps={30} durationInFrames={1369}/>
<Composition id="Slide14" component={Slide14} width={1920} height={1080} fps={30} durationInFrames={4838}/>
<Composition id="Slide15" component={Slide15} width={1920} height={1080} fps={30} durationInFrames={4388}/>
</Folder></>;
