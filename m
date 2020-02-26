Return-Path: <SRS0=Scut=4O=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E8EC4BA24
	for <workflows@archiver.kernel.org>; Wed, 26 Feb 2020 18:47:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3B4920714
	for <workflows@archiver.kernel.org>; Wed, 26 Feb 2020 18:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582742833;
	bh=ErVDkZ2VQSJ7LlDDGeC25w7LYykq20W6KOB9j5NrMDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=JhKA8NKbxJzOCNuAWw1CduxTzOaiKvxGjKjUjt/g0h44CeqRVDyaorrXXODiM2LeG
	 iqzqJrACtfS25jki5bnarCDzXiJ53N2GtGrE5KgGPO9yr3ENEyUFZ9X5cbEstFwKi8
	 dfbcqi4FFJVXHtW6xDX3D8wjPBKMFJouWH3dmTk4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgBZSrN (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Feb 2020 13:47:13 -0500
Received: from mail-qk1-f172.google.com ([209.85.222.172]:42893 "EHLO
        mail-qk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgBZSrN (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Feb 2020 13:47:13 -0500
Received: by mail-qk1-f172.google.com with SMTP id o28so467676qkj.9
        for <workflows@vger.kernel.org>; Wed, 26 Feb 2020 10:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=kM5VPBgMeCprpbci2WiPwpiP1A429sXsMj/hbj30Gic=;
        b=C5bcln8gTh9FLkwVDQLckm26CF3WZQW3vHNk0qUCWQ+Wx88rbBCvkbuiGoPMk66sz/
         90aHLQWgoIv23UqsQdneMu1mfqDONAp1Ndfplys979685rQ1M2qVPuFltNylwuRk9bgd
         UGCgWAcblrSkGrpW5rlliYY8KddPLEY/thPUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=kM5VPBgMeCprpbci2WiPwpiP1A429sXsMj/hbj30Gic=;
        b=nghXFBwkR26GsDRDpIOvXeynUY6pzdBMDo+oFs/c687HSjZzlQRVMNO5nIPrlx7+nQ
         m+qk7+lIrHVZ5vHHmNsKZH/VCYwhdWmhuhow8t2CsuL2pNzlDIDuY/iOCa2Q6zPAnCNU
         do5Q4UDhFbTBAYzHeoThIbmaqFnHqr8KvnYPnZz0zligKSddV/EdDEOmE1sZ2NtLJJej
         H6r1gIT/cGUFGgZ6zClHT2XFI4XZrVZe3dNPvs8JsBa2SIwpKPqhpew8G5bLm2GpSewU
         RYgbI8cDMiopsxq8C8Dk4XlP6vFpYWQjcXJj5v1Qs1NzYK3JDepO/GbRzdkxSV+LpRtd
         1lAw==
X-Gm-Message-State: APjAAAV+v5vHYhkA61XHmU3ViyW++/zMT9lGPVWJOV2VuFY9GmtrZF1U
        JtKeTBbYa5oyYVIHoMP2x9IQZA==
X-Google-Smtp-Source: APXvYqxqjLo9EEYFucid6Fx8lzI7zGeMkztgtiHBhyA7+0mUVll5vGvYQTvqrxJNxk3S/96gIYmBlQ==
X-Received: by 2002:ae9:f81a:: with SMTP id x26mr557461qkh.231.1582742831957;
        Wed, 26 Feb 2020 10:47:11 -0800 (PST)
Received: from chatter.i7.local (146.ip-51-79-53.net. [51.79.53.146])
        by smtp.gmail.com with ESMTPSA id k29sm1582171qtu.54.2020.02.26.10.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 10:47:10 -0800 (PST)
Date:   Wed, 26 Feb 2020 13:47:06 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     workflows@vger.kernel.org
Subject: Re: Patch attestation RFC + proof of concept
Message-ID: <20200226184706.al6n6garpv2gqfej@chatter.i7.local>
Mail-Followup-To: Kees Cook <keescook@chromium.org>,
        workflows@vger.kernel.org
References: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
 <202002260938.BFA7FA03@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202002260938.BFA7FA03@keescook>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Feb 26, 2020 at 09:50:50AM -0800, Kees Cook wrote:
> > As I envision it, the submitter workflow would look as follows:
> > 
> > - the developer runs "git-format-patch"
> > - the developer reviews the changes and makes any last-minute edits they 
> >   deem necessary before submitting their work to the list/maintainer
> > - the developer executes "git-send-email"
> > - the developer runs "attest-patches -a *.patches"
> > - the developer sends attestation.eml to signatures@kernel.org
> >   (or the tool auto-POSTs it to the submission URL, as mentioned)
> > 
> > There can even be a fairly simple wrapper around git-send-email that 
> > would perform attestation as part of the "sending patches" stage.
> 
> FWIW, I would find this utterly trivial to add to my workflow. (The only
> minor difference that doesn't really matter is that in addition to
> series-style patches, I also regularly send one-offs, but that would
> just be a short attestation email.)

Yes, and you can even send a single attestation email for a bunch of 
patches that have nothing to do with each-other (i.e. they don't need to 
all be part of the same series). E.g. you could have an automated script 
that hooks into your "Sent" folder and sends regular attestations for 
any new patches it finds.

> > ## The reviewer workflow
> > 
> > The reviewer does not need to concern themselves with attestation until 
> > they are ready to apply the patches to their git tree. When that moment 
> > comes:
> > 
> > - the maintainer runs get-lore-mbox -aA (-A is not implemented yet)
> > - get-lore-mbox performs attestation before generating the am-ready mbox
> > - if attestation passes, get-lore-mbox adds two trailers to each patch: 
> >   "Attestation-by:" and "Attestation-verified:". In our example case 
> >   those are:
> >   Attestation-by: Kees Cook <kees@kernel.org> (pgp:8972F4DFDC6DC026)
> >   Attestation-verified: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> 
> We'll probably need to have a stable way to deal with key aliases. Even
> in this example my email addresses are keescook@chromium.org (patches
> and attestation sender), kees@outflux.net (comment in gpg sig), and
> kees@kernel.org (since that's what Konstantin used to fetch my key).

The TL;DR section uses the Web Key Directory to look up key information, 
which will strip any UIDs not matching @kernel.org. I totally disagree 
with this WKD behaviour, but I can't change it. This is why we pass the 
-F flag to attest-patches, which forces it to ignore From mismatches.

When a key is imported via something like kernel.org's pgpkeys.git 
repository, it will have all of your UIDs and the "Attestation-by" line 
will use the one that matches the email address in the From: field. This 
is the default behaviour.

> And perhaps I lack imagination, but what is the overall purpose of these
> proposed tags? If it's just a hint to whether the patch has attestation,
> the '-verified:' isn't needed. Anyone wanting to check attestation would
> always need to do the full heavy lifting anyway.

It's true, the -verified tag is redundant with Signed-off-by. I'm happy 
to drop it. On the other hand, I think the "Attestation-by" trailer is 
helpful because the Author of the patch may be different from the person 
sending the patches to the maintainer. E.g. in this case, where the 
patch author is different from the sender:
https://lore.kernel.org/linux-mm/20200204013345.IPi4a1jYT%25akpm@linux-foundation.org/

So, a presence of "Attestation-by: Andrew Morton" would help build 
attestation chain. If there is no "Attestation-by: Gang He", then we'll 
know that there was no cryptographic attestation for this patch en route 
to akpm.

> > - all attestations are recorded in the public-inbox "signatures" 
> > feed that can be mirrored along all other public-inbox repositories 
> > on lore.kernel.org
> 
> Moar blockchains! ;) But, yes, it provides a signed path from author to
> committer without interfering with existing workflows. I like it!

I tried not to use the "B" word, but sure. :) There is no 
proof-of-whatnot + global reconciliation in the case of git 
repositories, so it's not technically a blockchain in its strictest 
sense, even if we PGP-sign all commits. </pedant mode>

> > Downsides:
> > 
> > - we aren't solving the problem of delegated trust, which will continue 
> >   to be the hardest part behind any distributed development effort
> 
> This was immediately my first question. How does a committer choose the
> correct GPG key? /me waits for the kernel.org key server to appear...

The attest-patches script offers the -t flag, which forces the "TOFU" 
trust model, meaning that the fist time you come across a key that you 
don't know, it's considered good and trusted. If in the future you come 
across another key with the same email address on the UID, GnuPG will 
mark both keys as untrusted and force you to pick which one you prefer.

There is also some ongoing effort that tries to implement the 
"distributed ID" spec for git [1], which aims to standardize on a way to 
pass developer key information via the repository itself (or via a 
linked repository). It's an ambitious goal, but if it's successful, then 
it will offer a way to record key information for most prominent 
developers inside git itself (similar to pgpkeys.git).

[1]: https://public-inbox.org/git/CACi-FhDeAZecXSM36zroty6kpf2BCWLS=0R+dUwuB96LqFKuTA@mail.gmail.com/

In general terms, though, I see this mostly being relevant in ongoing 
long-term developer relationships. The goal is to prevent malicious 
tampering of patches that appear to be coming from a fellow developer 
with whom you have a long-term collaboration history and whose judgment 
you trust.

If you're receiving a patch submission from someone with whom you have 
no history, then you have no reason to trust that their code is not 
trying to do something malicious -- in which case checking their PGP 
signature will not be meaningful anyway.

> Thanks for working on this! It was fun being the alpha guinea pig. ;)

I totally forgot to thank you for kindly agreeing to guinea-pig this for 
me. :) So, thanks again!

-K
