Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB522D5A18
	for <workflows@vger.kernel.org>; Thu, 24 Jul 2025 19:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753384248; cv=none; b=fRSZWMs8HvGcCKnCBv4l1pB174M5+YBErZfZKPUD6n9LFfxyTrSoFx6iFkW1BfizDs8e9F/IZq4B48tRkjur2IJsAu8XeYfhAbqPlgKsESMVmqMixHkba9Gg5BGizKcSbYrdK+kLOGz6mjFeYEZN0rAW4XdJQsDRYszFkcPALIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753384248; c=relaxed/simple;
	bh=6VzKvBxe+x0dLXaTHYQkE0P2jCw69AmXXSfPwuihTDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLUHnHy8PXwLqiE1bKwoQX4TGxBO6ddt6bvp9zSRd+zoM0i6QXPA1fRJjw1DQgPBZ4Ijj8fgQnf7Wpa/kPnWPWDBguN1xeMInR/CVL0P99J6wEnZ6sS40kF9l4Gn2gXAm+eahdyxENTYRicdZgOIwwB3P51sJAw+LvkhtBUi0+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jf7MJMr4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jf7MJMr4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OIjnCp022229
	for <workflows@vger.kernel.org>; Thu, 24 Jul 2025 19:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XxYio0K7T9By9N7RrMQybN+LqfZKKGACiSmYaMQcmMM=; b=jf7MJMr4i4PR+fKW
	m2yYlRwxO0Djwi7vG8kp5VwhQEpvKRpMTJJbjgm9Fj/LfwhZfawQqMs8Vr5ABkBT
	R+i0TLfNI6UHexiSReO8sBYl792tz8RRCM6xiq/oT0K6X9TQhdeRWiZa0qhTeHyP
	2/BYsji4lRaQqfe03Snu+C0GMZoZYrthcVPECNND9ihM5oRlwqmWNqKSTt+kudY+
	wyhGst6lhxjHjB1TjaLuRbOhQo6p6SjZfEvWsOVwUGUgW1f3L4zMnbZZi+9UIcDp
	ZuHv4Lkm7okdwxnflqPR6zIKL3lxFSuwNrmZC0tfOIDj+MyYkSP0vXP683aVz0+0
	j9YhAA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kmhuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Thu, 24 Jul 2025 19:10:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235196dfc50so14214425ad.1
        for <workflows@vger.kernel.org>; Thu, 24 Jul 2025 12:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753384244; x=1753989044;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XxYio0K7T9By9N7RrMQybN+LqfZKKGACiSmYaMQcmMM=;
        b=dXjUB6LjofkdakiGNxSfQIdzr30y2Y5i4y+nqCgjPNXmPdxwtjjLKOCa6Vo1f9X6kD
         oqrk8S3nD3bT/ocbZoSKwy2OzOwtLfZAawAL95/goBU4StN6B/0L8SGXsmhaZnos8V16
         2RpLd+pe/VI67Bq1MO9TIiUsIcWx3gy7rfAFWd1T6Tz90qAD/UTd0Uj7aXKR0st8uGbE
         s2834osaT4yheIKJFmKHqqhu+RDA566wjbYg2YKQPFMA4lVVPrJzq5XpA4NxgLdJjvd6
         UxENfHsQcue3dLB1JW183/NS3/vlLaU2v16P7rfv9pV4Zh0LQDeYakWTcI9NEfStE62K
         3Hgg==
X-Forwarded-Encrypted: i=1; AJvYcCVj/ajrKN0sY0mf9QJKiFf1pp7XmaSp7TTrjK04B5u5ofn2WmHE45A94MZaDD07qUbaxxtDqz1xg6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLNWWUq/v6xeH8IvkSKaf7udWLEKOcKi36hKOZm0KbF65OJ88s
	cK15jhW2EPXm4UrbtzQBOCGA65/lkoAjNXvLQvroDLbulvkL7UBP6goP9ETsSTASS/a2DrGotBZ
	vaMrrrTloRkwwlexvPbccdaYgodXlmGHxeMww7gGpKQt5FBMtCHbt69u55MXJNMk=
X-Gm-Gg: ASbGnctZFzzJYPOgcoi4GRLjLQ9UnsRSblmNMEiW3cf4/a8zQrrS8iOYojOQLA13U+q
	7W22EPwANnla266MnXh4mX66KOUtOvzoXbxkI7C/7Imf0waD2dcJPI+0xNJX3QgrFeHyIgYUybn
	hqVSl+IhdkLXQXA3kmKMqqXTFvm+g7ToiOO2MfLYGTXy+QfRhzIJsLlD6ULbGRaQcNO7RFKGk17
	DdirK5ZOo2n0SSLAU6n2LYNXvfgrvxLN7koHyGzCEsxDr0+Xhif/bHs7WraG0A5eXbsbuGwkgk3
	F1x0fyMz/Hhf+JqzzY8Nw4qEk+W/6FnzRhP2EkzgweO9LUQsJKOcN/ZEU9gwSVpnW07g53zXngs
	fslbRegi0UjzvBQ3eRCeGt6VV0WQN7yvX
X-Received: by 2002:a17:902:f542:b0:23d:dd63:2ce0 with SMTP id d9443c01a7336-23fa5c06662mr49915035ad.0.1753384244168;
        Thu, 24 Jul 2025 12:10:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd4HGRYy7Xw8xqOMHyfQIZjIuNNn8OXLvGqwn+P23z5SGAiVE3F8vL2sWnJcXMsgqXGBFpoQ==
X-Received: by 2002:a17:902:f542:b0:23d:dd63:2ce0 with SMTP id d9443c01a7336-23fa5c06662mr49914585ad.0.1753384243662;
        Thu, 24 Jul 2025 12:10:43 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa4760090sm21507575ad.39.2025.07.24.12.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 12:10:43 -0700 (PDT)
Message-ID: <51eab1fa-5ea6-41f2-8b5b-fc5c16a9bca3@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 12:10:41 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checkpatch: validate commit tag ordering
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
        dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, joe@perches.com,
        corbet@lwn.net, apw@canonical.com
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250724072032.118554-1-hendrik.hamerlinck@hammernet.be>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250724072032.118554-1-hendrik.hamerlinck@hammernet.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE0OCBTYWx0ZWRfXxYw4hfWRPCJW
 fCa2xSxKY/dHmZj87yvS81D0Xglp8qfma/HpwdLbtTJEx52GL7UM1juPWtgEjDkYEuQxiMXh+LG
 e7BmaOB9c4N2RaCQSyoLb4gb8MV+Lz0d6B1POu7b2csl2/04B+6jwMOUuXuFfPny1pV4m5zGEqm
 Tjh8a8mVOo31wr6OCR9TxioDpXPKWiFGDr51UNQE64HXs5d77p+QMM5qFZr6avsJrSDeHXZLzH/
 Rur8NsgzpYNXRo8Xs7wIhs+R/Y8ifGym2t4peHDCgM4cXIe8SoFIUEXgOddtreRw3RXO/ZAcAkP
 vVynvosm0CPUJ7Aq7hFsiYUHvXl2kqOzJ4djRhFuBk7bxmTLTCFaSxgIc4Tkdi4L/8eD1Yj6wo/
 Hg0EUj3lUxlT6FRBA3qGaIBITpYtTW6jUVqLhY6Gkyxj80y5AbLf0ku4Rb5z+GrrRP83tsuX
X-Proofpoint-ORIG-GUID: Q_UyYkLuWS2F2zyOywL9bYx5H3Y2JksH
X-Proofpoint-GUID: Q_UyYkLuWS2F2zyOywL9bYx5H3Y2JksH
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=68828535 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=KKAkSRfTAAAA:8 a=hSkVLCK3AAAA:8 a=4qB7ejF5Bm_TvqDGC3AA:9 a=QEXdDO2ut3YA:10
 a=_BXbQ_c0VdwA:10 a=D0TqAXdIGyEA:10 a=_wmjd-tGZtcA:10 a=xa8LZTUigIcA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22 a=cQPPKAXgyycSBL8etih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240148

On 7/24/2025 12:20 AM, Hendrik Hamerlinck wrote:
> Modified the checkpatch script to ensure that commit tags (e.g.,
> Signed-off-by, Reviewed-by, Acked-by, Tested-by, etc.) appear in the
> correct order according to kernel conventions [1].
> 
> checkpatch.pl will now emit a BAD_TAG_ORDER warning when tags are out of
> the expected sequence. Multiple tags of the same type are allowed, but
> they must also follow the order. 'Link:' tags in the changelog are still
> allowed before the tag sequence begins, but once the sequence has started,
> any 'Link:' tags must follow the ordered commit tags. 
> 
> Link: https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#ordering-of-commit-tags # [1]
> 
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> ---
>  Documentation/dev-tools/checkpatch.rst |  6 ++++
>  scripts/checkpatch.pl                  | 40 ++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index 76bd0ddb0041..696b42bf4ff5 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -599,6 +599,12 @@ Commit message
>  
>      See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
>  
> +  **BAD_TAG_ORDER**
> +    The tags in the commit message are not in the correct order according to
> +    community conventions. Common tags like Signed-off-by, Reviewed-by,
> +    Tested-by, Acked-by, Fixes, Cc, etc., should follow a standardized sequence.
> +
> +    See: https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#ordering-of-commit-tags
>  
>  Comparison style
>  ----------------
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 664f7b7a622c..267ec02de9ec 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -661,6 +661,24 @@ foreach my $entry (@link_tags) {
>  }
>  $link_tags_search = "(?:${link_tags_search})";
>  
> +# Ordered commit tags
> +our @commit_tags = (
> +	"Fixes:",
> +	"Reported-by:",
> +	"Closes:",
> +	"Originally-by:",
> +	"Suggested-by:",
> +	"Co-developed-by:",
> +	"Signed-off-by:",
> +	"Tested-by:",
> +	"Reviewed-by",
> +	"Acked-by:",
> +	"Cc:",
> +	"Link:"
> +);
> +our $commit_tag_pattern = join '|', map { quotemeta($_) } @commit_tags;
> +our $commit_tags_regex = qr{(?xi: ^\s*($commit_tag_pattern))};
> +
>  our $tracing_logging_tags = qr{(?xi:
>  	[=-]*> |
>  	<[=-]* |
> @@ -2712,6 +2730,8 @@ sub process {
>  
>  	my $checklicenseline = 1;
>  
> +	my $last_matched_tag;
> +
>  	sanitise_line_reset();
>  	my $line;
>  	foreach my $rawline (@rawlines) {
> @@ -3258,6 +3278,26 @@ sub process {
>  			}
>  		}
>  
> +# Check commit tags sorting
> +		if (!$in_header_lines && $line =~ $commit_tags_regex) {
> +			my $tag = $1;
> +			my ($tag_index) = grep { lc($commit_tags[$_]) eq lc($tag) } 0..$#commit_tags;
> +
> +			if ($last_matched_tag &&
> +			    $last_matched_tag->{tag_index} > $tag_index) {
> +				WARN("BAD_TAG_ORDER",
> +				     "Tag '$tag' is out of order. Should come before '$last_matched_tag->{tag}'\n" . $herecurr);
> +			}
> +
> +			# Allow link tags to occur before the commit tags
> +			if (lc($tag) ne "link:" || defined $last_matched_tag) {
> +				$last_matched_tag = {
> +					tag       => $tag,
> +					tag_index => $tag_index,
> +				};
> +			}
> +		}
> +
>  # Check email subject for common tools that don't need to be mentioned
>  		if ($in_header_lines &&
>  		    $line =~ /^Subject:.*\b(?:checkpatch|sparse|smatch)\b[^:]/i) {

Seems this logic would fail when there are multiple reporters, such as in
commit 9a44b5e36cd699fdd2150a63fab225ac510c1971

Fixes: 49e47223ecc4 ("wifi: cfg80211: allocate memory for link_station info structure")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/81f30515-a83d-4b05-a9d1-e349969df9e9@sabinyo.mountain/
Reported-by: syzbot+4ba6272678aa468132c8@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/68655325.a70a0220.5d25f.0316.GAE@google.com



