<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.smct-notify-form">
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-smct-notify-form" ox-mod="smct-notify-form">
        	<xsl:choose>
        		<xsl:when test="count(data/post-message/i) &gt; 0">
        			<div class="result">
		                <div class="result-icon result-code-0"></div>
		                <div class="result-msg">
		                    您的通知信息已经提交成功
		                </div>
		            </div>
        		</xsl:when>
        		<xsl:otherwise>
		            <form>
		                <input type="hidden" name="ref" value="q/post-message.ref"/>
		                <input type="hidden" name="uid" value="login/uid"/>
		                <ul>
		                    <li class="type-select">
		                        <select name="message" required="required">
		                            <option value="">请选择</option>
		                            <option>挡路</option>
		                            <option>交通事故</option>
		                            <option>车窗未关</option>
		                            <option>其它</option>
		                        </select>
		                    </li>
		                    <li class="type-file">
		                    	<div class="imgupload-combo" data-name="imgs">
		                            <label class="input-file-trigger" for="{generate-id(.)}">
		                                附加图片
		                            </label>
		                            <input id="{generate-id(.)}" style="position:fixed;left:-9999px;top:-9999px;"
		                                   placeholder="" data-name="imgs" type="file"/>
		                            <input type="hidden" name="imgs" />
		                        </div>
		                    </li>

		                    <li class="bottom">
		                        <button class="J_submit">提交</button>
		                    </li>
		                </ul>
		            </form>
	            </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>
</xsl:stylesheet>
