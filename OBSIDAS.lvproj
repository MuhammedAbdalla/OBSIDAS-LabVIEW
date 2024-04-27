<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="17008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Application.vi" Type="VI" URL="../Application.vi"/>
		<Item Name="EntireSpectrumProcess.vi" Type="VI" URL="../EntireSpectrumProcess.vi"/>
		<Item Name="LogAverage.vi" Type="VI" URL="../LogAverage.vi"/>
		<Item Name="LogSum.vi" Type="VI" URL="../LogSum.vi"/>
		<Item Name="OctaveBandsProcess.vi" Type="VI" URL="../OctaveBandsProcess.vi"/>
		<Item Name="WriteToFile.vi" Type="VI" URL="../WriteToFile.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="_2DArrToArrWfms.vi" Type="VI" URL="/&lt;vilib&gt;/sound2/lvsound2.llb/_2DArrToArrWfms.vi"/>
				<Item Name="_Get Sound Error From Return Value.vi" Type="VI" URL="/&lt;vilib&gt;/sound2/lvsound2.llb/_Get Sound Error From Return Value.vi"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="DAQmx Create Channel (AI-Voltage-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Voltage-Basic).vi"/>
				<Item Name="DAQmx Create Virtual Channel.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Virtual Channel.vi"/>
				<Item Name="DAQmx Read (Analog 1D DBL NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 1D DBL NChan 1Samp).vi"/>
				<Item Name="DAQmx Read.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read.vi"/>
				<Item Name="DAQmx Timing (Sample Clock).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Sample Clock).vi"/>
				<Item Name="DAQmx Timing.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing.vi"/>
				<Item Name="DAQmx Unflatten Channel String.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/miscellaneous.llb/DAQmx Unflatten Channel String.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Dynamic To Waveform Array.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Dynamic To Waveform Array.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="ex_BuildTextVarProps.ctl" Type="VI" URL="/&lt;vilib&gt;/express/express output/BuildTextBlock.llb/ex_BuildTextVarProps.ctl"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="ex_Modify Signal Name.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_Modify Signal Name.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="Move t0 to the end.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Move t0 to the end.vi"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="NI_AALBLAS.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBLAS.lvlib"/>
				<Item Name="NI_AALPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALPro.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Path To Command Line String.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Path To Command Line String.vi"/>
				<Item Name="PathToUNIXPathString.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/CFURL.llb/PathToUNIXPathString.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="Sound Data Format.ctl" Type="VI" URL="/&lt;vilib&gt;/sound2/lvsound2.llb/Sound Data Format.ctl"/>
				<Item Name="Sound File Close.vi" Type="VI" URL="/&lt;vilib&gt;/sound2/lvsound2.llb/Sound File Close.vi"/>
				<Item Name="Sound File Info (refnum).vi" Type="VI" URL="/&lt;vilib&gt;/sound2/lvsound2.llb/Sound File Info (refnum).vi"/>
				<Item Name="Sound File Position.ctl" Type="VI" URL="/&lt;vilib&gt;/sound2/lvsound2.llb/Sound File Position.ctl"/>
				<Item Name="Sound File Read (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/sound2/lvsound2.llb/Sound File Read (DBL).vi"/>
				<Item Name="Sound File Read Open.vi" Type="VI" URL="/&lt;vilib&gt;/sound2/lvsound2.llb/Sound File Read Open.vi"/>
				<Item Name="Sound File Read Simple.vi" Type="VI" URL="/&lt;vilib&gt;/sound2/lvsound2.llb/Sound File Read Simple.vi"/>
				<Item Name="Sound File Refnum.ctl" Type="VI" URL="/&lt;vilib&gt;/sound2/lvsound2.llb/Sound File Refnum.ctl"/>
				<Item Name="SoundVib_Calibration.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/Sound and Vibration/svt_Calibration/SoundVib_Calibration.lvlib"/>
				<Item Name="SoundVib_Octave_2014 standard.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/Sound and Vibration/svt_Octave/SoundVib_Octave_2014 standard.lvlib"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="StatisticsType.ctl" Type="VI" URL="/&lt;vilib&gt;/express/express shared/StatisticsType.ctl"/>
				<Item Name="subDisplayMessage.vi" Type="VI" URL="/&lt;vilib&gt;/express/express output/DisplayMessageBlock.llb/subDisplayMessage.vi"/>
				<Item Name="subStatistics.vi" Type="VI" URL="/&lt;vilib&gt;/express/express analysis/StatisticsBlock.llb/subStatistics.vi"/>
				<Item Name="sv_Coefficients for Exponential Averaging.vi" Type="VI" URL="/&lt;vilib&gt;/addons/Sound and Vibration/svt_Level/subVIs/sv_Coefficients for Exponential Averaging.vi"/>
				<Item Name="sv_Equivalent Continuous Level with IC_octave.vi" Type="VI" URL="/&lt;vilib&gt;/addons/Sound and Vibration/svt_Level/subVIs/sv_Equivalent Continuous Level with IC_octave.vi"/>
				<Item Name="sv_Exp Avg Level with IC (final value)_octave.vi" Type="VI" URL="/&lt;vilib&gt;/addons/Sound and Vibration/svt_Level/subVIs/sv_Exp Avg Level with IC (final value)_octave.vi"/>
				<Item Name="sv_Impulse Peak Detector with IC (final value)_octave.vi" Type="VI" URL="/&lt;vilib&gt;/addons/Sound and Vibration/svt_Level/subVIs/sv_Impulse Peak Detector with IC (final value)_octave.vi"/>
				<Item Name="sv_Peak Level with IC_octave.vi" Type="VI" URL="/&lt;vilib&gt;/addons/Sound and Vibration/svt_Level/subVIs/sv_Peak Level with IC_octave.vi"/>
				<Item Name="svc_Caller VI Returned in Error Source.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Caller VI Returned in Error Source.vi"/>
				<Item Name="svc_Channel Info.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Controls/svc_Channel Info.ctl"/>
				<Item Name="svc_Check dt for Equal Sample Rates.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Check dt for Equal Sample Rates.vi"/>
				<Item Name="svc_Check for Waveform Parameter Continuity (1 Ch).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Check for Waveform Parameter Continuity (1 Ch).vi"/>
				<Item Name="svc_Check for Waveform Parameter Continuity (N Ch).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Check for Waveform Parameter Continuity (N Ch).vi"/>
				<Item Name="svc_Check for Waveform Parameter Continuity (no state).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Check for Waveform Parameter Continuity (no state).vi"/>
				<Item Name="svc_Complex Datatype Defaults.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Complex Datatype Defaults.vi"/>
				<Item Name="svc_Complimentary Spectrum Units.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Controls/svc_Complimentary Spectrum Units.ctl"/>
				<Item Name="svc_Compute Scale Factor to Convert C to EU.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Compute Scale Factor to Convert C to EU.vi"/>
				<Item Name="svc_Compute Scale Factor to Convert V to EU.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Compute Scale Factor to Convert V to EU.vi"/>
				<Item Name="svc_Convert Spectrum Array to dB.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Convert Spectrum Array to dB.vi"/>
				<Item Name="svc_Engineering Units Text Ring.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Controls/svc_Engineering Units Text Ring.ctl"/>
				<Item Name="svc_Engineering Units to Unit Label.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Engineering Units to Unit Label.vi"/>
				<Item Name="svc_Format Value (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Format Value (DBL).vi"/>
				<Item Name="svc_Get SV Channel Info.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Get SV Channel Info.vi"/>
				<Item Name="svc_Get Weighting Enum and Labels.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Get Weighting Enum and Labels.vi"/>
				<Item Name="svc_Get Window Info.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Get Window Info.vi"/>
				<Item Name="svc_Log View for Power Spectrum (1 Ch).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Log View for Power Spectrum (1 Ch).vi"/>
				<Item Name="svc_Octave Filter Bank Parameters.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Controls/svc_Octave Filter Bank Parameters.ctl"/>
				<Item Name="svc_Octave Filter State.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Controls/svc_Octave Filter State.ctl"/>
				<Item Name="svc_Octave Info.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Controls/svc_Octave Info.ctl"/>
				<Item Name="svc_Octave Standard.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Controls/svc_Octave Standard.ctl"/>
				<Item Name="svc_Resampled Channel Info.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Controls/svc_Resampled Channel Info.ctl"/>
				<Item Name="svc_Set dB ref if Pascal.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Set dB ref if Pascal.vi"/>
				<Item Name="svc_Set SV Channel Info (SGL).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Set SV Channel Info (SGL).vi"/>
				<Item Name="svc_Set SV Channel Info (variant).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Set SV Channel Info (variant).vi"/>
				<Item Name="svc_Set SV Channel Info.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Set SV Channel Info.vi"/>
				<Item Name="svc_Spectrum Info.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Controls/svc_Spectrum Info.ctl"/>
				<Item Name="svc_Spectrum Type.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Controls/svc_Spectrum Type.ctl"/>
				<Item Name="svc_Spectrum Units.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Spectrum Units.vi"/>
				<Item Name="svc_Unit Label Lexical Class.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Unit Label Lexical Class.vi"/>
				<Item Name="svc_Unit Label Manipulation.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Unit Label Manipulation.vi"/>
				<Item Name="svc_Unit Label to Engineering Units.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Unit Label to Engineering Units.vi"/>
				<Item Name="svc_Waveform Parameters.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Controls/svc_Waveform Parameters.ctl"/>
				<Item Name="svc_Weighting Filter Text Ring.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Controls/svc_Weighting Filter Text Ring.ctl"/>
				<Item Name="svc_Weighting to Weighting Label.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Weighting to Weighting Label.vi"/>
				<Item Name="svc_Window [Dual FFT].ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Controls/svc_Window [Dual FFT].ctl"/>
				<Item Name="svc_Window Parameters.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/svc_Window Parameters.vi"/>
				<Item Name="svc_Window.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Controls/svc_Window.ctl"/>
				<Item Name="svc_X-Axis Units.ctl" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Controls/svc_X-Axis Units.ctl"/>
				<Item Name="SVFA Coherent Output Power.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Baseband FFT/SVFA Coherent Output Power.vi"/>
				<Item Name="svfa_Average Array (complex) No State.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Spectrum Averaging/svfa_Average Array (complex) No State.vi"/>
				<Item Name="svfa_Average Array (complex).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Spectrum Averaging/svfa_Average Array (complex).vi"/>
				<Item Name="svfa_Average Array (real) No State.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Spectrum Averaging/svfa_Average Array (real) No State.vi"/>
				<Item Name="svfa_Average Array (real).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Spectrum Averaging/svfa_Average Array (real).vi"/>
				<Item Name="svfa_Average Array with Avg Checks (complex) (1 Ch).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Spectrum Averaging/svfa_Average Array with Avg Checks (complex) (1 Ch).vi"/>
				<Item Name="svfa_Average Array with Avg Checks (complex) No State.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Spectrum Averaging/svfa_Average Array with Avg Checks (complex) No State.vi"/>
				<Item Name="svfa_Average Array with Avg Checks (real) (1 Ch).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Spectrum Averaging/svfa_Average Array with Avg Checks (real) (1 Ch).vi"/>
				<Item Name="svfa_Average Array with Avg Checks (real) No State.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Spectrum Averaging/svfa_Average Array with Avg Checks (real) No State.vi"/>
				<Item Name="svfa_Build Spectrum Info (Dual).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Spectrum Info/svfa_Build Spectrum Info (Dual).vi"/>
				<Item Name="svfa_Check Data Valid [Dual FFT].vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Baseband FFT/subVIs/svfa_Check Data Valid [Dual FFT].vi"/>
				<Item Name="svfa_Check for AvgParam Change (Dual).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Check for Parameter Change/svfa_Check for AvgParam Change (Dual).vi"/>
				<Item Name="svfa_Check for FRF Mode Change (Dual).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Check for Parameter Change/svfa_Check for FRF Mode Change (Dual).vi"/>
				<Item Name="svfa_Check for Window Change (Dual).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Check for Parameter Change/svfa_Check for Window Change (Dual).vi"/>
				<Item Name="svfa_Check Waveform Parameter Continuity (1x1) [Dual FFT].vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Check Signal Continuity/svfa_Check Waveform Parameter Continuity (1x1) [Dual FFT].vi"/>
				<Item Name="svfa_Convert to One-Sided Cross Spectrum.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Baseband FFT/subVIs/svfa_Convert to One-Sided Cross Spectrum.vi"/>
				<Item Name="svfa_Convert to One-Sided Power Spectrum.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Baseband FFT/subVIs/svfa_Convert to One-Sided Power Spectrum.vi"/>
				<Item Name="svfa_Linear OneShot or AutoRestart Averaging Done.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Spectrum Averaging/svfa_Linear OneShot or AutoRestart Averaging Done.vi"/>
				<Item Name="svfa_No Average Array (complex).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Spectrum Averaging/svfa_No Average Array (complex).vi"/>
				<Item Name="svfa_No Average Array (real).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Spectrum Averaging/svfa_No Average Array (real).vi"/>
				<Item Name="svfa_Peak Hold Array.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Spectrum Averaging/svfa_Peak Hold Array.vi"/>
				<Item Name="svfa_Process Coherence.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Baseband FFT/subVIs/svfa_Process Coherence.vi"/>
				<Item Name="svfa_Process Coherent Output Power.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Baseband FFT/subVIs/svfa_Process Coherent Output Power.vi"/>
				<Item Name="svfa_Reset Averaging State Info.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Spectrum Averaging/svfa_Reset Averaging State Info.vi"/>
				<Item Name="svfa_Scaled Time Domain Window (1 Ch).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Windowing/svfa_Scaled Time Domain Window (1 Ch).vi"/>
				<Item Name="svfa_Scaled Time Domain Window (Array).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Windowing/svfa_Scaled Time Domain Window (Array).vi"/>
				<Item Name="svfa_Scaled Time Domain Window (dual).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Windowing/svfa_Scaled Time Domain Window (dual).vi"/>
				<Item Name="svfa_Spectrum Info Window to windowTd Type Def.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Spectrum Processing/subVIs/svfa_Spectrum Info Window to windowTd Type Def.vi"/>
				<Item Name="SVL Set dB Reference (variant).vi" Type="VI" URL="/&lt;vilib&gt;/addons/_NISVFA/_Shared subVIs/Common/SVL Set dB Reference (variant).vi"/>
				<Item Name="svl_Exponential Filter with IC.vi" Type="VI" URL="/&lt;vilib&gt;/addons/Sound and Vibration/svt_Level/subVIs/svl_Exponential Filter with IC.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="Waveform Array To Dynamic.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Waveform Array To Dynamic.vi"/>
				<Item Name="Waveform Min Max.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/WDTOps.llb/Waveform Min Max.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
			</Item>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
			<Item Name="lvblas.dll" Type="Document" URL="/&lt;resource&gt;/lvblas.dll"/>
			<Item Name="lvsound2.dll" Type="Document" URL="/&lt;resource&gt;/lvsound2.dll"/>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="Application" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{1041BAB9-8556-4770-8B84-9AF9CFBC0123}</Property>
				<Property Name="App_INI_GUID" Type="Str">{108868DB-F033-4065-A8DD-952810AA0D9E}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{BAD8DF03-45AE-4CF3-8D1F-7F0ADA256702}</Property>
				<Property Name="Bld_buildSpecDescription" Type="Str">Application.exe buil 2.0.1
April 26 2024</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Application</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../exe</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToProject</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{972BE41D-82B3-4815-8728-7E93BDCEF0F6}</Property>
				<Property Name="Bld_version.build" Type="Int">3</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">Application.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../exe/Application.exe</Property>
				<Property Name="Destination[0].path.type" Type="Str">relativeToProject</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../exe/data</Property>
				<Property Name="Destination[1].path.type" Type="Str">relativeToProject</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{1446A6DA-E41E-41CC-9F8B-C649B59F8ED5}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Application.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/EntireSpectrumProcess.vi</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[2].type" Type="Str">VI</Property>
				<Property Name="Source[3].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/WriteToFile.vi</Property>
				<Property Name="Source[3].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[3].type" Type="Str">VI</Property>
				<Property Name="Source[4].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[4].itemID" Type="Ref">/My Computer/LogAverage.vi</Property>
				<Property Name="Source[4].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[4].type" Type="Str">VI</Property>
				<Property Name="Source[5].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[5].itemID" Type="Ref">/My Computer/LogSum.vi</Property>
				<Property Name="Source[5].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[5].type" Type="Str">VI</Property>
				<Property Name="Source[6].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[6].itemID" Type="Ref">/My Computer/OctaveBandsProcess.vi</Property>
				<Property Name="Source[6].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[6].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">7</Property>
				<Property Name="TgtF_companyName" Type="Str">Cambridge Rindge &amp; Latin School</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Application</Property>
				<Property Name="TgtF_internalName" Type="Str">Application</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2024 Cambridge Rindge &amp; Latin School</Property>
				<Property Name="TgtF_productName" Type="Str">Application</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{98B9DA2B-41EA-48AA-A1D3-6BF571D87B09}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Application.exe</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
		</Item>
	</Item>
</Project>
