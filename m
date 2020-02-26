Return-Path: <SRS0=Scut=4O=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E151EC4BA24
	for <workflows@archiver.kernel.org>; Wed, 26 Feb 2020 20:42:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A988724653
	for <workflows@archiver.kernel.org>; Wed, 26 Feb 2020 20:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582749758;
	bh=ufRWkclrnyGUCrOiifl5vubLloC/7g1vwTffDINBKyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=veztcM58EJd3MPl7xDLpt/xkns1NWIa8jYX6Ju2AsKpMle2lr7E7zqif3V0fw9y5P
	 eMG3HKD19gBItmHVKA2jD0A4fkY4vkfU+zqvRfwGb3laZ4relpdGB/2a5wIZQ8TGEn
	 e8v0ozsT1fd578s7Tcm22nIF7IZO/p+NtPARkT14=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbgBZUmi (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Feb 2020 15:42:38 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35505 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbgBZUmi (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Feb 2020 15:42:38 -0500
Received: by mail-wr1-f65.google.com with SMTP id w12so474618wrt.2
        for <workflows@vger.kernel.org>; Wed, 26 Feb 2020 12:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=XD8K1BM0wjjc8MJEr1+0svDMY/PYFoiL5sM2Yv9KYVU=;
        b=h5afksI5bbjuNfaew0xzt2pklpdJhj/8hxEO7JJrAyGNxIlvRjnZBXDAM4Hsg5lt8D
         VZqW2xLOzXF5kug765p7CbkM5FSTJfCw81hsfdzFcoJcXkoZeU6tMytpCMHtxPTydYnR
         uneeSG9UPWU6+KltJbll470ESBAfZ7Mdefm/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=XD8K1BM0wjjc8MJEr1+0svDMY/PYFoiL5sM2Yv9KYVU=;
        b=IN5YX95/XAbl3Bcr7shrgFqWb6TAa5J+TJ95ixpU11OKRog1iiGhFubUjIzl3LGmF0
         x7BW4F/QybtiMnby20menAi37JocAr5ZvqZNzt0aUkwerITYK8UzBJhj0RDJavSUNprB
         JW2WH45t7mqytqqqQTLDCxyFtMrcEVl3AmaPjE4KJP96ybg2F/QI1FNAZhstd39yfOJt
         eqIY8Y/x9VbuxWnOxM18vrQSzR33yJMW4+OU22NLzuV1DBUDtSCdScME+r6SD15KH+Iz
         UOL1w3JtAaZBvyJQvWWK7ofT84/vmqHBVa/zFprJibM7/XoQtRiNd1iLRRNYvy/xfcNF
         +h3A==
X-Gm-Message-State: APjAAAUkgkNnVlaEoa14RijPhQf81jR2h9AzFpu6ssrhYARwZBJVyf0s
        gFtxjAsN5iIOs+PI+Odfd+di89txBivIBQ==
X-Google-Smtp-Source: APXvYqzRgqVS4JW7bHgiHVT6Jq1cZ0U53hKzBFyIq5FkDEAe0Z4+EIrofvefeFTGDQAnOiFzP+e/5g==
X-Received: by 2002:adf:f310:: with SMTP id i16mr501481wro.326.1582749755745;
        Wed, 26 Feb 2020 12:42:35 -0800 (PST)
Received: from chatter.i7.local ([185.220.101.73])
        by smtp.gmail.com with ESMTPSA id z6sm4602691wrw.36.2020.02.26.12.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 12:42:35 -0800 (PST)
Date:   Wed, 26 Feb 2020 15:42:31 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     workflows@vger.kernel.org
Subject: Re: Patch attestation RFC + proof of concept
Message-ID: <20200226204231.x5jbqgmkedtgpkmn@chatter.i7.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>, workflows@vger.kernel.org
References: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
 <20200226201140.GA24263@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200226201140.GA24263@ziepe.ca>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Feb 26, 2020 at 04:11:40PM -0400, Jason Gunthorpe wrote:
> > If you look at the contents of the patch attestation message 
> > (https://lore.kernel.org/signatures/202002251425.E7847687B@keescook/), 
> > you will notice a yaml-style formatted document with a series of 
> > three hashes. Let's take the first one as example:
> > 
> > 2a02abe0-215cf3f1-2acb5798:
> >   i: 2a02abe02216f626105622aee2f26ab10c155b6442e23441d90fc5fe4071b86e
> >   m: 215cf3f133478917ad147a6eda1010a9c4bba1846e7dd35295e9a0081559e9b0
> >   p: 2acb5798c366f97501f8feacb873327bac161951ce83e90f04bbcde32e993865
> > 
> > The source of these hashes is the following patch:
> > https://lore.kernel.org/kernel-hardening/20200225051307.6401-2-keescook@chromium.org/
> 
> If you define an alternative message signature algorithm like this,
> then is there still value in detatching the PGP signature from the
> patch email?

I believe that yes, because it offers better workflows around the
following scenarios:

- developer does all their work on a remote VM that doesn't have access 
  to their PGP keys and submits actual attestation when they get back to 
  their workstation
- developer configures their smartcard to require a PIN during each 
  operation and disables the pgp-agent; sending a series of 40 patches 
  requires a single PIN entry instead of 40
- developer submits a v1 of the patch that they don't expect to pass on 
  the first try and doesn't bother submitting attestation; shockingly,
  the maintainer accepts it as-is and the developer can attest their 
  patches post-fact *without* needing to collect all the acked-by's 
  reviewed-by's etc from all others who have already responded to the v1 
  submission

> The usual PGP signature computes a hash of the message in a certain
> way (with unquoting etc). If you instead replace that with your method
> and then just generate the normal base64 blob using:
> 
>   msg_hash = HASH(HASH(i) || HASH(m) || HASH(p))
>   sig = RSA_Sign(msg_hash)

The reason I want to leave i/m/p hashes individually present is because 
it makes it possible to query patch attestation information based on a 
subset of full information.

For example, a maintainer will almost certainly edit the message content 
to add their own Signed-off-by, and may edit the patch for minor 
nitpicking. Full i-m-p attestation will fail in this case, but we can 
then query the signatures archive for each individual hash to identify 
which part of the submission fails validation:
https://lore.kernel.org/signatures/?q=2a02abe02216f626105622aee2f26ab10c155b6442e23441d90fc5fe4071b86e

This lets us present the maintainer with more useful info, like: "full 
attestation failed, but the only changed part is actually the message 
and not the patch content, so it's probably still okay to apply."

> Then the base64 of the sig can just be dropped at the end of the
> message, and doesn't need to be detached, or need the various ---BEGIN
> PGP--- overheads
> 
> The magic I see here is defining a way to compute the message hash of
> a patch email that doesn't cause a big mess.

I still think that one of the key benefits of this proposal is being 
able to submit patch attestation data post-fact. For signatures included 
with patches, I'd rather see this happen during the git-format-patch 
step following Vagard Nossum's work of fully reconstructing commits from 
patches -- see my email to the git list here:
https://lore.kernel.org/git/20200226200929.z4aej74ohbkgcdza@chatter.i7.local/T/#u

Best,
-K
