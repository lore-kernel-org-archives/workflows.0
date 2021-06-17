Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47521C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 18:43:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38E7C613FB
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 18:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbhFQSpm (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 14:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231497AbhFQSpl (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 14:45:41 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A60C061574
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 11:43:32 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id q16so4608909qkm.9
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 11:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KSkMrcggjCOoGEJDL1W3dI4ogdg629R++loSanZwrJw=;
        b=IQ6Q61OfGl9aEOAgh47Bv5MKaeICIQnMHHRXUM1RRRPzvlnsmuAxTUu2eRXL153TgD
         6uOpLurz+yqkfFfvJhDVXzq4NJIyvkROyIgyJtw6RusU7Z2vo8bWG9VL7AQ03QAXr2qE
         CIRm/V+0Pp6igJuXVjeyaJ2FImsbS7OD//VvSaP9vwTSpTglbfCDs3nX/IqMZYOP2vzP
         10fx2F0Q66Hzh/jnR150pQFOuJwkBG3KKb8Fqpfe5u8r8l3CiRT+6Y+1EASEDuftkO1e
         Xp0r3iCf4DxjIgNv7GeFH5lgsfprj6Rf1rrOjasUJvhERBoHvZ9u7YcZBgLNXsRxzRAi
         DU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KSkMrcggjCOoGEJDL1W3dI4ogdg629R++loSanZwrJw=;
        b=hDpVBW8dSAj/+WsG7MHJBacBoLDruJl5lje79Wi1LmuVx4R874BZlYkXqXqow+ZfBV
         IPxG6mBaqYotqiLi/B+ZI/Ku7o8jaOGBjZyF3c+kFvU9ShVJgyDjoaYf5cx4PIoEXZBj
         SEq/vW2CTaPQk6WmTPt/28Nk4bFKqRlStZRFjj0T9p8har0LqJFodaY0BN0X9g46QDrn
         VHb9CbqrFA3il2MfoSmBpvxCQmvlLcTUXar+aDVH5xhxKoqZMK+DTJ6jSdgtwpAQebPi
         GW43p2AzAA6OkmUm//B2/NNpvVRi4uC+oYZd/e4htJt7FpfMi6Dc2ZanK01jps4hEXrc
         4QCA==
X-Gm-Message-State: AOAM533bgrmj+Wmv239IAgN+fJA+dn9rOKsYUa2mVv+q8ve4XYZgnk4g
        ooHC5s95fYxggc2CdJwS8JSLZuTR4n2gBVmh2fo=
X-Google-Smtp-Source: ABdhPJxF7Rj4MF9jImAHBj7QS4RAAuxUX7v3dws2R3S1ucsExuDiJyh5rblLCJogtTzzE3OxRztJikyM5Hdf5eT7JuI=
X-Received: by 2002:a25:cc55:: with SMTP id l82mr8570032ybf.26.1623955411662;
 Thu, 17 Jun 2021 11:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <YMsGoI0UdbmUebhX@infradead.org>
 <nycvar.YFH.7.76.2106171031220.18969@cbobk.fhfr.pm> <CACT4Y+YoHYCKaLdZFSLqKsMz1j72i=k12FVpmSo-OyB7rCorsw@mail.gmail.com>
 <YMsfXuykH6z0ZbpM@infradead.org> <20210617145728.nahkvtxapozccm6c@nitro.local>
 <20210617151659.GF5067@sirena.org.uk> <YMtpHPaJzMxmhslt@pendragon.ideasonboard.com>
In-Reply-To: <YMtpHPaJzMxmhslt@pendragon.ideasonboard.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 17 Jun 2021 20:43:20 +0200
Message-ID: <CANiq72n-L=aroXFfnoF96Edk6F7+hqHu_BTaKuKAeA0MgOcSbw@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Jiri Kosina <jikos@kernel.org>, users@linux.kernel.org,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 5:24 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> There are some features (or lack thereof) of git..b that I suspect
> actively decrease the quality of the hosted software. For instance, the
> inability to comment on the commit messages during review can play a
> role in the average low quality of those messages. Similarly, review is

It only decreases the quality of the repository if you allow the
commits to go in.

The same happens in the LKML -- some people have sent bad messages,
but we correct them and they learn.

Also, as soon as you have a queue of well-written PRs (equivalently:
messages in lore), then it is easier for others to know what the
customs for a given project are.

> Developers who have only been exposed to those platforms are very likely
> to never have learnt the importance of commit messages, and of proper
> split of changes across commits. Those are issues that are inherent to
> those platforms and that we will likely need to handle in an automated
> way (at least to some extent) or maintainers will become crazy (I know
> we already suffer from those issues with the mailing list-based
> workflow, but I believe it would get worse, not better, and some of our
> maintainers are already suffering way more than they should).

I am not sure it would get worse: in Rust for Linux, contributors that
were new to the kernel process learnt quite quickly how to write
proper commit messages.

I think all depends on how willing to learn people is and how strict
maintainers are enforcing things.

But I agree that a bot that automatically performs the basic reviews
helps *a lot*.

Cheers,
Miguel
