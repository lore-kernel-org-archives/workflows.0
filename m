Return-Path: <SRS0=Scut=4O=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B61C4BA21
	for <workflows@archiver.kernel.org>; Wed, 26 Feb 2020 21:18:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 920FB24656
	for <workflows@archiver.kernel.org>; Wed, 26 Feb 2020 21:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582751894;
	bh=QNBZb91fZ/Z+6y6GpwCwNZDyFvp59a7thOO/9LAIgR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=JveIq07Dx7TgSyXgGKblbXS57tMfRxVYumfpuZkJZ7nP5Hh6w0NJ1N+IUxoDvJu9H
	 EY7AvBuiQeDEYULYD181l8ubshu+OWd5murnoFTxKWY+Tcp1vgGen+Ow+5Vbo2msxo
	 GNg1sRNjLomntxY+zkloGCW8Z0v5nUcAN37lBoX8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbgBZVSO (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Feb 2020 16:18:14 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43329 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727483AbgBZVSO (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Feb 2020 16:18:14 -0500
Received: by mail-wr1-f68.google.com with SMTP id c13so555320wrq.10
        for <workflows@vger.kernel.org>; Wed, 26 Feb 2020 13:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=d4Qoj2GBaZEsfg0aOsj7g0H+JrNxOPl4aPoH+HBNTk0=;
        b=GTI/bfffN3RjCaaLpdGVc4psbRV6XGrYuolJCV2wTM9ifuFS2NU4OOOBGfYpxoi4+k
         2efNFJ3YhIAsOW+DAXHevz7+s+E6CsKv16rqxuiPcrvg84v4rjbONLZ0rDbsmQ9qqzG3
         HGTVQDG5No5rLjReU9N0hnk+E5LA32o9syBlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=d4Qoj2GBaZEsfg0aOsj7g0H+JrNxOPl4aPoH+HBNTk0=;
        b=SHxcxY2tf0f+SeMp8cHbqxKpRraSDbd4iv5I345WzanGB76naQ1uDwOGpRps52fzGt
         RU/iyUIDQDUIKOrigVbEuvD6sfhtwBrb0/J/2wANN3ewhozmw2tJ65nV/Bx6JNlbmbQQ
         2j51CKAggiirVkA+CTXL1ZBfDeHZXHKIKZVCNOeVS7FYKVJuay3TQJ0pYkIuqnDfk6or
         4/o+UNSMUwmvU4zBza7sLyptABJ68BAI7OsDEWnh5Z/JhZj1IXuFx8qqR27AWxV2HGGj
         9dT/LO0OufDtUIlE8EBJ7mlm6SG3d9EE+NO9TkdEQBI1rzl6O5akjvthBPMYXDwBwEvb
         WeIw==
X-Gm-Message-State: APjAAAVmCJdcaDuLo/NUW94W2G/IyTN2jjCyPmWm+PAHMwo+xz3Iq0p6
        veB2S8d12TQNsQUEK37Ooxz2AFcCqGi6XA==
X-Google-Smtp-Source: APXvYqxId9TyxfNt1D4I1thHgOOrn40zOm+2xDkTERBS4iWi9k3Me5B01wL8eaGD8xy9YkWL5Lsbng==
X-Received: by 2002:a5d:514b:: with SMTP id u11mr585912wrt.322.1582751891159;
        Wed, 26 Feb 2020 13:18:11 -0800 (PST)
Received: from chatter.i7.local (tor-exit-13.zbau.f3netze.de. [185.220.100.240])
        by smtp.gmail.com with ESMTPSA id f65sm4390605wmf.29.2020.02.26.13.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 13:18:09 -0800 (PST)
Date:   Wed, 26 Feb 2020 16:18:05 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     workflows@vger.kernel.org
Subject: Re: Patch attestation RFC + proof of concept
Message-ID: <20200226211805.4whl5fnxy5ydhs4u@chatter.i7.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>, workflows@vger.kernel.org
References: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
 <20200226201140.GA24263@ziepe.ca>
 <20200226204231.x5jbqgmkedtgpkmn@chatter.i7.local>
 <20200226210442.GE31668@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200226210442.GE31668@ziepe.ca>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Feb 26, 2020 at 05:04:42PM -0400, Jason Gunthorpe wrote:
> > - developer does all their work on a remote VM that doesn't have 
> > access to their PGP keys and submits actual attestation when they 
> > get back to their workstation
> 
> Unfortunately this is a challenging work flow for a lot of reasons. :(

Can you describe why? I would expect that this is done fairly routinely 
due to having more compute power on a remote VM to run various tests.

> > - developer configures their smartcard to require a PIN during each 
> > operation and disables the pgp-agent; sending a series of 40 patches 
> > requires a single PIN entry instead of 40
> 
> This is certainly my situation, my PGP key lives in a yubikey token
> configured for physical presence to confirm. :\

I'm in the same boat. :)

> > - developer submits a v1 of the patch that they don't expect to pass on
> >   the first try and doesn't bother submitting attestation; shockingly,
> >   the maintainer accepts it as-is and the developer can attest their 
> >   patches post-fact *without* needing to collect all the acked-by's 
> >   reviewed-by's etc from all others who have already responded to the v1 
> >   submission
> 
> But there won't be tags in this case, so how do we learn the original
> attestation-id to find the detatched signature?

The attestation would be performed before all the follow-up tags are 
applied, so the attestation-id would be the same. After the patch is 
applied to a git repository, we can still use the "i" hash to look it up 
(see more below).

> > For example, a maintainer will almost certainly edit the message 
> > content to add their own Signed-off-by, and may edit the patch for 
> > minor nitpicking. 
> 
> The i/p/m will always change once in git:
>    - The commit message is always changed, at least to add sign off
>    - The email Subject is always changed to strip [PATCH xxx]

This is already done by "git mailinfo" so I would expect that the i: 
hash almost never changes, actually, unless the maintainer actually 
edits the subject. Subject + Author + Email are sufficiently unique to 
be able to locate the attestation data of the exact patch.

> If we know the expected ID then you could do some fuzzy scheme to
> cancel out, or at least check, the differences..
> 
> We have many patches now that have Link: trailer. I think it would be
> useful to run some analysis:
>  - Fetch the original patch email from the Link and compute the
>    detached signature hashes
>  - Attempt to validate this sigature against the git commit
>  - Is there a fuzzy algorithm that brings this rate higher?

So, the goal is not really to perform attestation once the patches made 
it into the git tree. I am specifically trying to address the following 
cases:

- Someone poses as a trusted developer and submits a malicious patch
- Someone bribes me to edit a patch on lore.kernel.org to introduce a 
  backdoor

Currently, maintainers have no mechanism to check against either of 
these cases. Adopting end-to-end patch attestation resolves both 
problems.

> > Full i-m-p attestation will fail in this case, but we can then query 
> > the signatures archive for each individual hash to identify which 
> > part of the submission fails validation:
> > https://lore.kernel.org/signatures/?q=2a02abe02216f626105622aee2f26ab10c155b6442e23441d90fc5fe4071b86e
> >
> > This lets us present the maintainer with more useful info, like: "full 
> > attestation failed, but the only changed part is actually the message 
> > and not the patch content, so it's probably still okay to apply."
> 
> How does the message body get changed in transit from the submitter to
> the maintainer?

It shouldn't, because this means that the patch becomes mangled. We do 
perform a single normalization routine, which is converting all '\r\n' 
into '\n'. Any other changes done to bodies mean broken patches.

-K
