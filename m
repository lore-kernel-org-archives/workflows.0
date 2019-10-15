Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41BCC10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 15:34:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C786620640
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 15:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571153659;
	bh=4A+KzpA6LoOr4velWRNwJLM2KR+IaHiq5gcKf/byPDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Z0FdtRvuykQjuTj196H9tF9pzItyz7rzmftWZJGb3+0RShMbam3byTsB0y4GEIUkX
	 9pDp3XSM/V1/JeEO1HPVU4Pw+GAoz2MdMna6Bny2ymGwItG6CeSL3JMD+jzUgSPfqR
	 roj/sBj4Kpu6IvP7Eet5hE5ow9bCRF7hekYwtU38=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387489AbfJOPeT (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 11:34:19 -0400
Received: from mail-qt1-f171.google.com ([209.85.160.171]:39426 "EHLO
        mail-qt1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732659AbfJOPeT (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 11:34:19 -0400
Received: by mail-qt1-f171.google.com with SMTP id n7so31146204qtb.6
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2019 08:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gzr4IEUeg1rNxZYacA6EWRUqIm2x9B+QplyuRBEeTWY=;
        b=aAFyWErnT5kFC86ukR+dRR03kZ0WYpPM8pHGzG3LP1A/9jkt5zOhnkyH3QU2xNJPVt
         fN0jcFVT7afMudwR5ZTnsaiu9DqP/IuYYLojK3f+ffZvqIaBaFvD/ha1s1/fs2Bk2ULw
         DE6PGxvhUizmMtpnwcM2QLWABWHwZCZYk+NMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=gzr4IEUeg1rNxZYacA6EWRUqIm2x9B+QplyuRBEeTWY=;
        b=YnqyhFTORN/tQkPP1iD0Zv4IWZxuLbybiRphB3St26oU+fwVvSTt3xCAkWb2lCHzt4
         FdqVAr0W0l5GZAo/H+/z2RizZWjZi5Z3jIb/ikjUzRBG/nB4pK94b6K8NErWhyHAA9qQ
         CoNGUASXgY+H+kibMO3P3tOonWm/j/oAZ/t+ORCSIpou9IQ23OUMFsy8nw05ZXdg6V2n
         f6bci4kYJqg7bxhjSlzRyJZZOMqow43kszMK7Uc8QNOPgLpvQ8eNH+akKhtXQk3pEZwV
         L/qdnaCOyl4ZAFkCSKDGN/TbybBY9xOs5gnZ4icKwPun/Xl4kwA1ZVnN2k4w2a6Q6gVV
         JzCw==
X-Gm-Message-State: APjAAAXpWpIXO9d+AVfJAoq65lHGM7D/IoYCU5SsnbUuW/QilPu6H6Rw
        71bag2VDOfHHVZfC7cNjceweZt24eP4=
X-Google-Smtp-Source: APXvYqwEm8wtJlj9XXQvIR8FAuhPzMBzNdgDOuy9XzAsKqIF9yoZu6tHJfiFKy5OcIqHuGRKum+hCQ==
X-Received: by 2002:ac8:2c7b:: with SMTP id e56mr40268827qta.295.1571153658233;
        Tue, 15 Oct 2019 08:34:18 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id x6sm9771170qts.37.2019.10.15.08.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 08:34:17 -0700 (PDT)
Date:   Tue, 15 Oct 2019 11:34:15 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Eric Wong <e@80x24.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015153415.GB11491@chatter.i7.local>
Mail-Followup-To: Eric Wong <e@80x24.org>,
        Greg KH <gregkh@linuxfoundation.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
 <20191011212308.xk7xcvfamwnkwovn@dcvr>
 <20191011213553.g3pleurh5uomumi7@chatter.i7.local>
 <20191013233930.GB13089@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20191013233930.GB13089@dcvr>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sun, Oct 13, 2019 at 11:39:30PM +0000, Eric Wong wrote:
>> Well, this is the bit where I say that it may not be allowed by 
>> corporate
>> rules. I see this all the time in CAF/Android world where companies
>> *require* that all email goes through their SMTP server so that it can be
>> properly logged (often for legal reasons). And it is often equally required
>> that any code submissions come from person@corporate.com and not
>> person@free-email-provider.com for License/CLA reasons, so setting up a
>> webmail server is not a solution either.
>
>Aren't they still allowed to submit stuff via forges the same way
>they'd use a potential hacker-oriented webmail/SMTP/IMAP solution?

You're trying to apply logic to legal requirements. :) It's actually 
fine for someone to submit a Github pull request using their corporate 
"From:", because it's not an action that sends email from their 
corporate address. Email is considered official company correspondence 
and therefore must be preserved in case it needs to be turned over 
during lawsuits (for fact-finding).

>We can also find creative ways to subvert corporate policies:
>For example; if their policy specifically prevents outgoing SMTP,
>"git imap-send" could be used.

I'm generally against recommending solutions that can get people into 
legal trouble. If their company requires that all work correspondence is 
sent via the company's SMTP server, then we shouldn't be putting forth 
technical solutions defeating this.

-K
