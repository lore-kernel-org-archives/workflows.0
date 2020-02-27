Return-Path: <SRS0=vuSN=4P=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30FDC4BA2D
	for <workflows@archiver.kernel.org>; Thu, 27 Feb 2020 13:30:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78B7721556
	for <workflows@archiver.kernel.org>; Thu, 27 Feb 2020 13:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Hl4EWc86"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbgB0Nat (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 27 Feb 2020 08:30:49 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:49869 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729056AbgB0Nat (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 27 Feb 2020 08:30:49 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89f48274
        for <workflows@vger.kernel.org>;
        Thu, 27 Feb 2020 13:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=s+fQZok1RCj5JYCluZpxB8Q2bIE=; b=Hl4EWc
        86poBdLL0Sl3XhAQ0YG5LBQycNzYY/2lKalHC9iigoPO3sdKGZhp9ExRl5puGWg5
        7K/iGobfjJ2/Tew0GJgMUE4NRLAZ9s/vW9JZH+1JDgOR5REl8165+YC3SqwEgFnZ
        dj4p1UEje49r7Rz3Ap26hRZi3FSTVqdEJZ4PadV9fs3QprlolW6NApKfxUkaHeYb
        4mgzMOkmvjpbsMIh28u4Im5RD7xbI0gWo5QFTFkPXy2EH2vUs0SQaWGcnkPfcw4E
        kuOk49hgbSZQ0A9UJkU8KlNR9VwuI1ETnvsNxyo5tR+5cnv3yCcIaKA0lOrt1J0w
        h8/DUtWvZkKdWSHA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6c36c29e (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
        for <workflows@vger.kernel.org>;
        Thu, 27 Feb 2020 13:27:00 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id i1so3248182oie.8
        for <workflows@vger.kernel.org>; Thu, 27 Feb 2020 05:30:47 -0800 (PST)
X-Gm-Message-State: APjAAAUlI1gRmaRNIXdjZNK/fUseHuuBNyGh18K2VC1dnmRvmgVBcfWj
        ql6pF3J3Qu3gbeWniBukE6rlLJ4Nzqvwge6nYM0=
X-Google-Smtp-Source: APXvYqzBOduTGTI9KjBgiRnxzalCL4SfZbymzR3iLNOaFhcpXM1zwu7NtEkQBrxkQxC+CUY1QrLAmFdNRZzOD43BV+8=
X-Received: by 2002:aca:815:: with SMTP id 21mr3402776oii.52.1582810246379;
 Thu, 27 Feb 2020 05:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
 <20200227041144.GA36493@zx2c4.com> <CAMuHMdXiVO8Lkg-qk1VQmp8opfoOXfurgkaqQcA5DdK78RBWow@mail.gmail.com>
In-Reply-To: <CAMuHMdXiVO8Lkg-qk1VQmp8opfoOXfurgkaqQcA5DdK78RBWow@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Thu, 27 Feb 2020 21:30:35 +0800
X-Gmail-Original-Message-ID: <CAHmME9pLHMM=Bkw2Kd4wk7Q=rboBRvnNVaC8fBE9yCm2VJZwMA@mail.gmail.com>
Message-ID: <CAHmME9pLHMM=Bkw2Kd4wk7Q=rboBRvnNVaC8fBE9yCm2VJZwMA@mail.gmail.com>
Subject: Re: Patch attestation RFC + proof of concept
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     workflows@vger.kernel.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Feb 27, 2020 at 6:05 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> How would the commit base help here?  It would indicate this is an old
> patch, which would be indicated by the signature date, too.

For email, not much, since the patch is always disconnected. The point
is that this isn't a problem when verifying commits inside of git
itself because the signatures are over the commit's position in the
tree, so you can't reorder or rearrange commits. Not necessarily an
applicable solution here, but worth noting that other setups don't
encounter the same problem due to other, larger, design decisions.

> The only thing that would help is time-limiting the window between
> attestation and application.

Sure, one can draw up a few bandaids for this, such as: big red text
saying "warning, this commit is kind of old", which of course means
its date needs to be included in the metadata signature, and accurate
too. Maybe there are other bandaids. Or this is just a fundamental
issue with disconnected by-email patches that we'll have to live with.
