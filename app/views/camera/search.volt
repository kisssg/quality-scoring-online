{{ content()}}
<form action="" method="post">
日期：<input type="text" class="datepicker" name="visit_date" id="visit_date" value=""/>
催收员：<input type="text" name="journal_creator" id ="" value=""/>
合同号：<input type="text" name="contract_no" id ="" value=""/>
QC：<input type="text" name="QC" id ="" value=""/>
<input type="submit" class="btn btn-default btn-xs" value="搜索"/>
</form>
{% for journal in page.items %}
    {% if loop.first %}
<table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
            <th>合同号</th>
            <th>外催员</th>
            <th>外访结果</th>
            <th>外访日期</th>
            <th>外访时间</th>
            <th>视频</th>
            <th>录音</th>
            <th>录制开始</th>
            <th>录制线束</th>
            <th>评分</th>
            <th colspan="2">操作</th>            
        </tr>
    </thead>
    <tbody>
    {% endif %}
        <tr id="{{journal.id}}">
            <td class="contract_no">{{ journal.TEXT_CONTRACT_NUMBER }}</td>
            <td class="journal_creator">{{ journal.NAME_COLLECTOR }}</td>            
            <td class="visit_result_cn">{{ journal.VISIT_RESULT }}</td>
            <td class="visit_date">{{ journal.ACTION_DATE }}</td>       
            <td class="visit_time">{{ journal.ACTION_TIME }}</td>       
            <td class="CNT_VIDEO_RECORDS">{{ journal.CNT_VIDEO_RECORDS }}</td>       
            <td class="CNT_AUDIO_RECORDS">{{ journal.CNT_AUDIO_RECORDS }}</td>       
            <td class="CREATE_TIME">{{ journal.CREATE_TIME }}</td>       
            <td class="ENDING_TIME">{{ journal.ENDING_TIME }}</td>       
            <td>{{ journal.score }}</td>
            <input type="hidden" class="employee_code" value="{{journal.ID_EMPLOYEE}}"/>
            <input type="hidden" class="city" value="{{journal.SH_CITY}}"/>
            <input type="hidden" class="journalID" value="{{journal.id}}"/>
            <input type="hidden" class="SUM_VIDIO_TIME_DURATION" value="{{journal.SUM_VIDIO_TIME_DURATION}}"/>
            <input type="hidden" class="SUM_AUDIO_TIME_DURATION" value="{{journal.SUM_AUDIO_TIME_DURATION}}"/>
            
            <input type='hidden' class='object' value='{{journal.object}}'/>
			<input type='hidden' class='score' value='{{journal.score}}'/>
			<input type='hidden' class='remark' value='{{journal.remark}}'/>
			<input type='hidden' class='QC' value='{{journal.QC}}'/>
			<input type='hidden' class='QSCcreateTime' value='{{journal.QSCcreateTime}}'/>
			<input type='hidden' class='QSCcreateDate' value='{{journal.QSCcreateDate}}'/>
			<input type='hidden' class='QSCeditDate' value='{{journal.QSCeditDate}}'/>
			<input type='hidden' class='QSCeditTime' value='{{journal.QSCeditTime}}'/>
			<input type='hidden' class='cheating' value='{{journal.cheating}}'/>
			<input type='hidden' class='recSurrounding' value='{{journal.recSurrounding}}'/>
			<input type='hidden' class='announceContract' value='{{journal.announceContract}}'/>
			<input type='hidden' class='selfIntro' value='{{journal.selfIntro}}'/>
			<input type='hidden' class='RPCEndRec' value='{{journal.RPCEndRec}}'/>
			<input type='hidden' class='askOthers' value='{{journal.askOthers}}'/>
			<input type='hidden' class='leaveMsg' value='{{journal.leaveMsg}}'/>
			<input type='hidden' class='askForDebt' value='{{journal.askForDebt}}'/>
			<input type='hidden' class='tellConsequence' value='{{journal.tellConsequence}}'/>
			<input type='hidden' class='negotiatePay' value='{{journal.negotiatePay}}'/>
			<input type='hidden' class='provideSolution' value='{{journal.provideSolution}}'/>
			<input type='hidden' class='specificCollect' value='{{journal.specificCollect}}'/>
			<input type='hidden' class='payHierarchy' value='{{journal.payHierarchy}}'/>
			<input type='hidden' class='updateDT' value='{{journal.updateDT}}'/>
			<input type='hidden' class='cashCollect' value='{{journal.cashCollect}}'/>
			<input type='hidden' class='week' value='{{journal.week}}'/>
			<input type='hidden' class='auditResult' value='{{journal.auditResult}}'/>

            {%if journal.QC==""%}
            <td width="7%">{{ link_to("#", '评分', "class": "btn btn-default btn-xs","data-toggle":"modal","data-target":"#cameraScoreBoard","data-backdrop":"static","data-id":journal.id,"data-action":"add") }}</td>
 			{%else%}
 			<td width="10%">{{ link_to("#", '修改', "class": "btn btn-primary btn-xs","data-toggle":"modal","data-target":"#cameraScoreBoard","data-backdrop":"static","data-id":journal.id,"data-action":"edit") }}
 			<button class="btn btn-default btn-xs" onclick="return CameraScore.delete({{journal.id}});">清除</button>
            	{%if journal.auditResult=="blank"%}
            		{{ link_to("#", '审核', "class": "btn btn-default btn-xs","data-toggle":"modal","data-target":"#cameraScoreBoard","data-backdrop":"static","data-id":journal.id,"data-action":"audit") }}
 				{%else%}
					{{ link_to("#", '审核'~journal.auditResult, "class": "btn btn-primary btn-xs","data-toggle":"modal","data-target":"#cameraScoreBoard","data-backdrop":"static","data-id":journal.id,"data-action":"audit") }}
 				{%endif%}  
 			</td>
 			{%endif%}       
        </tr>
    {% if loop.last %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="11" align="right">
                    <span class="help-inline">{{page.total_items}}条 {{ page.current }}/{{ page.total_pages }}</span>
                <div class="btn-group">
                    {{ link_to("camera/search", '&laquo; 首页', "class": "btn btn-default") }}
                    {{ link_to("camera/search?page=" ~ page.before, '&lsaquo; 上一页', "class": "btn btn-default") }}
                    {{ link_to("camera/search?page=" ~ page.next, '下一页 &rsaquo;', "class": "btn btn-default") }}
                    {{ link_to("camera/search?page=" ~ page.last, '末页 &raquo;', "class": "btn btn-default") }}
                </div>
            </td>
        </tr>
    </tbody>
</table>

    {% endif %}
{% else %}
    No record
{% endfor %}


