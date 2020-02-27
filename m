Return-Path: <SRS0=vuSN=4P=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B92C4BA24
	for <workflows@archiver.kernel.org>; Thu, 27 Feb 2020 01:23:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5372B24650
	for <workflows@archiver.kernel.org>; Thu, 27 Feb 2020 01:23:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kBDTA06y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbgB0BXu (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Feb 2020 20:23:50 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:33181 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbgB0BXt (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Feb 2020 20:23:49 -0500
Received: by mail-qk1-f195.google.com with SMTP id h4so1645558qkm.0
        for <workflows@vger.kernel.org>; Wed, 26 Feb 2020 17:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F3mx6tBOuY9BEz3+GQlQFh1Z86qY3TxP/CJKUilPbD4=;
        b=kBDTA06y8w0L5uoHxGXDmHpkOqspsMhntltWn0M6XR5fSq3PD42kySTCVNAKlHMcNI
         U9VnO6iBVPKslHA5sl46lelmNsaPKbJ3n0J3COGJBAUV5VYc0AeWzD601neD0nb80mdt
         20K8YwYgvSsKovuh57mCV+dflEpjJdBV/U49u4l6RU5Zu9kf07h6SdFvXo37rT7abgHA
         X+YSz5wCzD6Ymc8pPJWFquLIIzUOyFj+OkO4/A1eTxyz+iCuUKQduhPvd8BeFYGVWxtl
         gjuuC1iabXn1z56fVXOScURAsaqsCu+NrRNQ7sEga/douj4S4U2Azi1X1MDEk0F7frEW
         YuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F3mx6tBOuY9BEz3+GQlQFh1Z86qY3TxP/CJKUilPbD4=;
        b=DgtBXIwxzXvft45kz4bMiOeKMlsVGRq3UQCQ4UhB1levIGcCYfwlsDMHaxYUj7OngW
         jDqnicaqVEU8QweS/nWYv/Cuuk2QCPb5YWQszC1uKDn+zwRznIXna+Ip2sloM39KNE06
         ndDX9/irsb/8gfWzBwtNvN8ZB483FG+I05SP3JYhupwRLcy36C4S9jQg+bknMB/du6be
         0OKW4Hb3w4k0GW7YUC9HghL8znL/KGdD1bIU2PXJDUm4NtT61QJKZYZo0dsglQy4aONq
         J2qQmG0im68PwJd3vrE/gPYKGjIaF0K6sfiJqFTCiOORCjJkbZasOxxoVQT+2LJLpYbg
         8eCg==
X-Gm-Message-State: APjAAAX35d6z6hESGCsSfpg1W8wKpAUc4lsGApIAZt6C6b6DbO1/ebU2
        Mlq7OeB8lj2GnWdsDZdW4irduQ21VQlKLA==
X-Google-Smtp-Source: APXvYqzg5qGBGs393Zm17CN99GaPDJNp8oXL8R5UioGDZfqcgloxRtm24H5cyPqUqXKy2w0/9wkDIA==
X-Received: by 2002:a37:8e44:: with SMTP id q65mr2439565qkd.70.1582766628109;
        Wed, 26 Feb 2020 17:23:48 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id v10sm2169339qtj.26.2020.02.26.17.23.47
        for <workflows@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 17:23:47 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1j77tz-0001Y0-0G
        for workflows@vger.kernel.org; Wed, 26 Feb 2020 21:23:47 -0400
Date:   Wed, 26 Feb 2020 21:23:46 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     workflows@vger.kernel.org
Subject: Re: Patch attestation RFC + proof of concept
Message-ID: <20200227012346.GF31668@ziepe.ca>
References: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
 <20200226201140.GA24263@ziepe.ca>
 <20200226204231.x5jbqgmkedtgpkmn@chatter.i7.local>
 <20200226210442.GE31668@ziepe.ca>
 <20200226211805.4whl5fnxy5ydhs4u@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226211805.4whl5fnxy5ydhs4u@chatter.i7.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Feb 26, 2020 at 04:18:05PM -0500, Konstantin Ryabitsev wrote:
> On Wed, Feb 26, 2020 at 05:04:42PM -0400, Jason Gunthorpe wrote:
> > > - developer does all their work on a remote VM that doesn't have 
> > > access to their PGP keys and submits actual attestation when they 
> > > get back to their workstation
> > 
> > Unfortunately this is a challenging work flow for a lot of reasons. :(
> 
> Can you describe why? I would expect that this is done fairly routinely 
> due to having more compute power on a remote VM to run various tests.

I've seen enough situations where people have a Linux server and a
Windows laptop. They don't have a Linux desktop, so mixing a local
'secure' PGP key in a windows environment with the remote Linux server
environment is challenging.

If you have a secure 'Linux desktop environment' then I'd imagine
always sending signed emails from there, and just using the server for
test/etc.

Certainly, exposing my email password (aka my cloud account password)
is of even greater risk to me (and my company!) than exposing my PGP
key. I want to keep it on my secure server, encrypted, etc. Actually
I'm trying hard to move all my email access to OAUTH to minimize risks
to my cloud accounts :\

> > > - developer submits a v1 of the patch that they don't expect to pass on
> > >   the first try and doesn't bother submitting attestation; shockingly,
> > >   the maintainer accepts it as-is and the developer can attest their 
> > >   patches post-fact *without* needing to collect all the acked-by's 
> > >   reviewed-by's etc from all others who have already responded to the v1 
> > >   submission
> > 
> > But there won't be tags in this case, so how do we learn the original
> > attestation-id to find the detatched signature?
> 
> The attestation would be performed before all the follow-up tags are 
> applied, so the attestation-id would be the same. After the patch is 
> applied to a git repository, we can still use the "i" hash to look it up 
> (see more below).

I'm not sure, if the '[PATCH xx v5]' is stripped then 'i' is not
unique any more?
 
> > > For example, a maintainer will almost certainly edit the message 
> > > content to add their own Signed-off-by, and may edit the patch for 
> > > minor nitpicking. 
> > 
> > The i/p/m will always change once in git:
> >    - The commit message is always changed, at least to add sign off
> >    - The email Subject is always changed to strip [PATCH xxx]
> 
> This is already done by "git mailinfo" so I would expect that the i:
> hash almost never changes, actually, unless the maintainer actually 
> edits the subject. Subject + Author + Email are sufficiently unique to 
> be able to locate the attestation data of the exact patch.

Ah, using git mailinfos is not how you described 'i':

$ egrep '^(Author|Email|Subject)' i | sha256sum
2a02abe02216f626105622aee2f26ab10c155b6442e23441d90fc5fe4071b86e  -

(also I do edit subjects a fair amount, again it would be interesting
 to see stats on how well this works)

> So, the goal is not really to perform attestation once the patches made 
> it into the git tree. I am specifically trying to address the following 
> cases:
> 
> - Someone poses as a trusted developer and submits a malicious patch
> - Someone bribes me to edit a patch on lore.kernel.org to introduce a 
>   backdoor

Okay, but then post-apply-attestation doesn't help this threat
model. post-apply-attestation is surely only useful if you can check
the signature from the git data?

Like I said it would be very interesting to see data on how well these
signatures could survive, if we could get, what, 80% coverage of git
commits this way then that seems like a powerful argument for this
approach, right?

Jason
