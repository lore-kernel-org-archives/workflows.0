Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA054C433C1
	for <workflows@archiver.kernel.org>; Tue, 23 Mar 2021 21:44:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77C21619CC
	for <workflows@archiver.kernel.org>; Tue, 23 Mar 2021 21:44:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233624AbhCWVn2 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 23 Mar 2021 17:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233651AbhCWVnV (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 23 Mar 2021 17:43:21 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4726BC061763
        for <workflows@vger.kernel.org>; Tue, 23 Mar 2021 14:43:20 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id x14so16047449qki.10
        for <workflows@vger.kernel.org>; Tue, 23 Mar 2021 14:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=9A5rYZcglsBI7NEDlAoTBU4Zl5wr8vyLdFv+U1vnm5o=;
        b=cU2MWXhrmvMJIPPFY+bbxexi0G0jjM8KNFl8VyfkYeVEF1MFNe/fqJxh7GgUPTFflR
         SqPsyfx5OyaVhrGA0H1VHSSGQAZLMkXY+YcBwxP1b7GoFjJYf3XxeaZXnYNHCRj38NDz
         +2sWveYk4PiEK7Ikf0nRgCsW3BPpRdxdvRz2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=9A5rYZcglsBI7NEDlAoTBU4Zl5wr8vyLdFv+U1vnm5o=;
        b=sxKGxKwPztwn6VZ9jBB/RdxAOFgpJ6qvF+rEQN72lRrjW83Zc2AXJGq9XO9NbB3nSi
         bY34Zlupxeyi/FRTnZc0zAiVjjrOYlu270/JJY4IYA2e2o0sAZfTOczcJRbPuFbAgSIh
         C++hWt+xO731yezfA02ZFUDushmW2HJ2J1olCWExbynV0Qfmz242N7aBF8vombJPGnmB
         LrBoP9azHkSc2KnqOubAmkHlM1rchXEhSGQB58TqB0KD7iuuWF4CRoeJ7gpxFH4xlaDU
         uxKb4LitDIiI2z2/8VaUzfk5oxq3s/oBAdzKjiIBZllPeNKTaca3vuyrZYTuGJU4Zojl
         Uavg==
X-Gm-Message-State: AOAM5338uJFZdnse5z9RgoibyPYX10uTbV7DE5Ua+z0Z9CivIwsUVAYX
        4yr12/6hwHQibeVcGzyfdz0C1g==
X-Google-Smtp-Source: ABdhPJxZJb+JsRQXrSlu96XRPInFDlUZede/dKLcYwQmDxWVCkMrvz2KcEfc8dhtyw7wL7Ctm5VKuA==
X-Received: by 2002:a05:620a:819:: with SMTP id s25mr79910qks.485.1616535799383;
        Tue, 23 Mar 2021 14:43:19 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id 79sm163979qki.37.2021.03.23.14.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 14:43:18 -0700 (PDT)
Date:   Tue, 23 Mar 2021 17:43:17 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        workflows@vger.kernel.org
Subject: Re: [Ksummit-discuss] RFC: create mailing list "linux-issues"
 focussed on issues/bugs and regressions
Message-ID: <20210323214317.t3igv3nan4lfolgr@chatter.i7.local>
Mail-Followup-To: James Bottomley <James.Bottomley@hansenpartnership.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        workflows@vger.kernel.org
References: <613fe50d-fc9c-6282-f1f3-34653acb2ee9@leemhuis.info>
 <CAHk-=wgiYqqLzsb9-UpfH+=ktk7ra-2fOsdc_ZJ7WF47wS73CA@mail.gmail.com>
 <62b60247-7838-a624-706e-b1a54785b2a5@leemhuis.info>
 <20210323122025.77888b49@gandalf.local.home>
 <72f1c67bc8ad21bb1e5a7d77b88e2c3e50065e3b.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <72f1c67bc8ad21bb1e5a7d77b88e2c3e50065e3b.camel@HansenPartnership.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Mar 23, 2021 at 09:30:33AM -0700, James Bottomley wrote:
> > I think the bulk of user issues are going to be regressions. Although
> > you may be in a better position to know for sure, but at least for
> > me, wearing my "user" hat, the thing that gets me the most is
> > upgrading to a new kernel and suddenly something that use to work no
> > longer does. And that is the definition of a regression. My test
> > boxes still run old distros (one is running fedora 13). These are the
> > boxes that catch the most issues, and if they do, they are pretty
> > much guaranteed to be a regression.
> > 
> > I like the "linux-regressions" mailing list idea.
> 
> Can't we use the fancy features of public inbox to get the best of both
> worlds?  Have the bug list (or even a collection of lists) but make the
> linux-regressions one a virtual list keying off an imap flag which a
> group of people control.  That way anything that is flagged as a
> regression appears in that public inbox.  I assume the search can be
> quite wide so we could flag a regression on any list indexed by lore?

There's a number of ways we can accomplish this, sure.

However, this functionality is not in production yet, and I'm not sure which
upcoming public-inbox features we'll be implementing as a public
lore.kernel.org service, which ones we'll only offer to kernel.org account
holders, and which ones should really be running locally by developers
themselves.

So, I don't want to say either yes or no to this one for the fear of
over-promising. I guess this is why I'm not in sales. :)

-K
