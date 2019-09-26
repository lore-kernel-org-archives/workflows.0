Return-Path: <SRS0=FCe/=XV=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7A6C4360C
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 15:06:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D2DF206E0
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 15:06:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CbOpwFDS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfIZPGK (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 26 Sep 2019 11:06:10 -0400
Received: from mail-qt1-f175.google.com ([209.85.160.175]:37209 "EHLO
        mail-qt1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbfIZPGK (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 26 Sep 2019 11:06:10 -0400
Received: by mail-qt1-f175.google.com with SMTP id l3so3275991qtr.4
        for <workflows@vger.kernel.org>; Thu, 26 Sep 2019 08:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=3vRNt3I9neYP3zUcDjQ2JABaCG09Ux1UyykFS6QZRSQ=;
        b=CbOpwFDSkAkpzNQlIjApuHGue5jhziiaqj1DP2ouBib9oq1GEGv0CRTCirdt7cvbB6
         7RUQ9YKdJEG4Ete578j2Am4BnmL4RWGG8ZUrejN3foyMCSRkNRdWm3Sy4pAb2fbWCViR
         h3f77exrUx4xj0avKMABoz0NVudy4TvPdf1xirWJmAVA7d8b79cvddBo9F3+zF1Wzs9q
         XS5Znge1quoQTZUCRL5Unxq7LBefZK/KcGhYsr14AZiVoAM3ySJXAo5Y5oI59knzmbdq
         Kgrl22r6mhgSMTTPUFNKxtiQG8ByYI1BZHRdHcUR1WggbznXhtf2rv8Ten3dzFlWl0+n
         /HIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=3vRNt3I9neYP3zUcDjQ2JABaCG09Ux1UyykFS6QZRSQ=;
        b=OJO1FpY9GGPl9xvwMIFMeG4jEU0EjoNmAiVbKiYLKgl5PFJKRRjVSJ9H9SmQYHQa2n
         ZtX1cGrV/BVebfKZIvdfyammE6tdR30zck6CpcbB5a47UN0yAI92HF3DWJztqHHVKdPE
         h9aYs2JZETh5BYQb0fAM20+0pGJrO826Km0f23/epHXWvTQRjcZVM3Q9p63ocaN5Xd10
         SCXfz/jdhw9c5ej9owkWRmkcqf/3LmDS4PJr3jgktGBW5ebHL7VF8acM30J1XfwAGjO6
         aDjrrKzDhW+0likaBa8pzWXrcXHHhguOKRxNr06tNzXgr0R/gMhaeDH6IAosa0R5YSKr
         O2Nw==
X-Gm-Message-State: APjAAAUxI3m5MRdlDMfi/8JjE0s+eCe9b1YzM9VL/wIxJElvqoJM74EU
        DbDnwrCOcVrFJUGmF8HXzzsL+FpNN1k=
X-Google-Smtp-Source: APXvYqwWt8aB8IkeWTKb8xs/cYPxdT71PZLZUGvZIpuaJl1fyFT9jSefJ2IioU/eYWsS/gPssxJJGw==
X-Received: by 2002:ac8:b41:: with SMTP id m1mr2382308qti.382.1569510367864;
        Thu, 26 Sep 2019 08:06:07 -0700 (PDT)
Received: from ?IPv6:2620:0:1004:a:6e2b:60f7:b51b:3b04? ([2620:0:1004:a:6e2b:60f7:b51b:3b04])
        by smtp.gmail.com with ESMTPSA id u17sm1084187qkj.71.2019.09.26.08.06.07
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2019 08:06:07 -0700 (PDT)
To:     workflows@vger.kernel.org
From:   Barret Rhoden <brho@google.com>
Subject: Ideas from Jane Street's code review
Message-ID: <c247f8eb-c324-30d3-b41d-02afe1dc829d@google.com>
Date:   Thu, 26 Sep 2019 11:06:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi -

Jane Street did some interesting things with their code review and 
workflow, such as handling diffs-of-diffs and tracking what needs to be 
reviewed.

Their ideas might be orthogonal to the whole "workflow that works for 
email / web / your-tool-here" discussion, but some of the underlying 
principles may inspire a good overall design:

Tech talk:
https://blog.janestreet.com/jane-street-tech-talk-how-jane-street-does-code-review/

Links to their blogs:
https://github.com/janestreet/iron

Barret

