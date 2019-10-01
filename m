Return-Path: <SRS0=W/h6=X2=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1152C388F3
	for <workflows@archiver.kernel.org>; Tue,  1 Oct 2019 05:04:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6EC320842
	for <workflows@archiver.kernel.org>; Tue,  1 Oct 2019 05:04:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="lK6HNYOC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfJAFEa (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 1 Oct 2019 01:04:30 -0400
Received: from mail-pf1-f176.google.com ([209.85.210.176]:42172 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbfJAFEa (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 1 Oct 2019 01:04:30 -0400
Received: by mail-pf1-f176.google.com with SMTP id q12so7044699pff.9
        for <workflows@vger.kernel.org>; Mon, 30 Sep 2019 22:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=4l0dg0M8NjqkocSKeh++ANmBguEcE58tWTQaoE7GXAA=;
        b=lK6HNYOCaOgoucqLoLhKrh1CYJvLV6sRy414x++r2dZBqeiCRixLZPMLyyDiAFyG54
         Hg2QmoPyGvJMGVYs4VTzRCR59JBrcGLEVHIWgIXdZVHdcHV0+a0y/SWmJcr98WCueuAw
         C2htoELXNJ6683bXQAT3J/3pBzuPBp/W9o/ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=4l0dg0M8NjqkocSKeh++ANmBguEcE58tWTQaoE7GXAA=;
        b=rx3KOfwis8BsMQttgMXnv+Bzaw/h2KRPTutE1geij3PKta8FZChuQ40RH7H1xWGkk+
         YJdaCoJLdItLi0av0z1zzdYWvr/9IyDX+R0TAXJDKDU39nbCJlW3wecb45ysNWDktS+e
         gx+ATgxYXNn/jOhwroHVFY27E2q2M65tNlKLK1vWS4+K59hGyndpbSQomcL7QhveDGkF
         OKiexsFpt01MTmK4vnf2zseLzIc8kareRHPasLPDoG+88Qm2HgD6Sxvjgg14bFXe7Bbo
         NM0xIr5ItmPGY/qsGq+qv7c298nZPrSqSGk11kYPxeQHxoVPtCdXD2WWNmB/L8giz3nP
         gqCQ==
X-Gm-Message-State: APjAAAWWz6nXUkzBiGafv0Z6ieRiqiZeMlJ2Ean77gwVlTwoDqKxu1O8
        LiHGjQ5fA75v+YwcJ24jO+VcHg==
X-Google-Smtp-Source: APXvYqyoeAcNasq8WS7MghBHGv2FfuA2FT7BzJihh8voxfxGXHeAoFaK8hNk7hmjya0XPjOB+Z7gxA==
X-Received: by 2002:aa7:8492:: with SMTP id u18mr943132pfn.247.1569906267931;
        Mon, 30 Sep 2019 22:04:27 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net. [59.167.251.205])
        by smtp.gmail.com with ESMTPSA id v19sm15016806pff.46.2019.09.30.22.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 22:04:27 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     Andrew Donnellan <ajd@linux.ibm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
In-Reply-To: <522b803e-027e-e809-5dfa-826861344bd1@linux.ibm.com>
References: <1811089.yxvLMk49Ug@kreacher> <5072394.GngetUhsyG@kreacher> <87blv13yxc.fsf@dja-thinkpad.axtens.net> <522b803e-027e-e809-5dfa-826861344bd1@linux.ibm.com>
Date:   Tue, 01 Oct 2019 15:04:14 +1000
Message-ID: <875zl93vld.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Andrew Donnellan <ajd@linux.ibm.com> writes:

> On 1/10/19 5:52 am, Daniel Axtens wrote:
>>> (d) Support for "maintainer views"
>>>
>>>      That is, by default subsystem maintainers should see patches, bug reports
>>>      etc against the code maintained by them, with the possibility to extend the
>>>      view to also see the other submissions.
>>>
>>>      [That kind of is the case in Patchwork today when patches sent to different
>>>       mailing lists show up under different "projects", but the problem in there
>>>       is that copies of one patch appear under multiple "projects" as different
>>>       entities if sent to multiple lists.]
>> 
>> /me puts on pw maintainer hat
>> 
>> This is true, they are each individual database entries. This is largely
>> because projects will often change the state of patches differently. (An
>> example is a patch sent to multiple lists to collect ACKs before being
>> merged.)
>
> We really should get around to adding inter-project links for matching 
> message-IDs.

Sure, we just have to get the UI right so that people aren't overwhelmed
in the case where a patch is sent to a dozen different lists.

Regards,
Daniel

>
> -- 
> Andrew Donnellan              OzLabs, ADL Canberra
> ajd@linux.ibm.com             IBM Australia Limited
