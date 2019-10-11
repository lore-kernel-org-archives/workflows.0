Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A0EECE58C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 10:46:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F08FD21D80
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 10:46:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GBgqihvw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbfJKKqf (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 06:46:35 -0400
Received: from mail-qt1-f180.google.com ([209.85.160.180]:33220 "EHLO
        mail-qt1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727289AbfJKKqf (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 06:46:35 -0400
Received: by mail-qt1-f180.google.com with SMTP id r5so13235432qtd.0
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 03:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ep2cxMR0WeX+YNvYPPxEjETtK9Kd1PBebp696ucn230=;
        b=GBgqihvwiukdvEx+g58rK/olxZfc/TrUdpnSRtG9svFVEZ+D31kgurHNdSBfxwXN8g
         gGxfuq27MUJi2SPCsmUrfHACkK5jM2JpmIW5qjjiy577MEL1yrfsuX0Uko8Xqwr7Y8UA
         ZOjruDCn8nw+18QICW54XJLLkqYzgu0o8KYpGmlpL/vt+CF2uoOlBBR6v6BqKnAJ9thF
         3Zz142AwCjZNxqJ+RLdL2UiAoXlCjQkB4tv4xgvIc6jcmeV3kumonomlXbX5Hee+kADa
         a2aonmiOci1apqxNuOnZBGCW/BG6dlYpWXWxfhrTRrix4VrlTOsa5u2g/FYC0V3h9PpE
         PG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ep2cxMR0WeX+YNvYPPxEjETtK9Kd1PBebp696ucn230=;
        b=dXac245IvlqeRW8ASsL+gzDYNB+uLAG/Yh5bNlbbbZsTPtq3M1tgdfDEfAl9YKzOLZ
         0YUu/6smUJzm8/RJFYBaZwa6AbJxau39s0Ivs24kbpluVpuCjXxjjl0Bg0cvyY625vTm
         UjVc1JgOC0f14t+W+O42xdpjuzugki+mVmd8tlAmTb9bf5M+Pzd1Za0WeIcOg+ZwvBt4
         dyn2K4FNzlg4s5Mk78PmHNBz1WzL/deAZKw+WfK3E3XGIwAp/jruCQ/jsULgOK6znTsM
         NsQlneqgBLsAJhHxqAXZUw/SkUVwjqZSy6PtkPptwoYFpGt8s0PSeEtMFxOin+ZKzJtR
         jtzQ==
X-Gm-Message-State: APjAAAV7GbA4fbLRb2HeexUNzhahFjuGiKfb/VgIwsXJKQgFj+g/0hxy
        YFioQ+l51LUw2sTMV1slJKPsXxqv8KbGrc5Y1v74Ew==
X-Google-Smtp-Source: APXvYqwEhLXTUgHetWKVWDwIiwhe2cTuZ5MdNrXrhFa6LmLoHe0MxHISGwxnUUUJ7CycNXltQiCbdNw9w2uyhTNbeLs=
X-Received: by 2002:ac8:4749:: with SMTP id k9mr15751080qtp.257.1570790792357;
 Fri, 11 Oct 2019 03:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190912120602.GC29277@pure.paranoia.local> <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <20190930202451.GA14403@pure.paranoia.local> <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
 <20191008165155.GA30571@chatter.i7.local> <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
In-Reply-To: <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 11 Oct 2019 12:46:20 +0200
Message-ID: <CACT4Y+ZcPf4HiXhBknBY=aE0hJM33e1FG8pVepb2hYXMvbiMVw@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development processes
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Dmitry Vyukov <dvyukov@gmail.com>, "Theodore Ts'o" <tytso@mit.edu>,
        Rob Herring <robh@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stefan@datenfreihafen.org, Sasha Levin <sashal@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 4:16 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Tue, 8 Oct 2019 at 12:51, Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> > >Hi Konstantin,
> > >
> > >Are you going to attend OSS Summit EU? If yes, I think we should sync
> > >up there. I know Dave and Greg are there too. Perhaps we could
> > >schedule some kind of semi-formal meeting?
> >
> > Unfortunately, no -- we have limited budget for traveling and I burned
> > through mine by going to Lisbon. I'd be happy to work on a draft
> > document that expands on my tooling vision (I'm doing so anyway), and I
> > can time it to be ready before the summit so you can review and improve
> > it. My hope is to submit it formally to the LF by the end of the month.
>
> Oh, hey, change of plans -- looks like I *will* be going to Lyon after
> all. I think sitting down together for a semi-formal meeting sounds
> like a good idea, considering all the active discussions happening
> lately. Should we hash out a tentative agenda about topics that we
> should and shouldn't cover? Who should be in attendance?

Re agenda.
For me the main bullet on the agenda would be figuring out high-level
final destination for the effort. I think we need to take a step back,
forget about implementation costs for a moment and try to imagine how
we want kernel development process to look like in 5-10 years. Once we
do that, most likely we will decide to cut some corners and compromise
on practical grounds, and definitely have some incremental process of
getting there. But still making small steps with a clear vision of the
final destination is very different from making conflicting small
steps in random directions.
It should help us to avoid conflicting, duplicate and throwaway
efforts. Personally I would be much more willing to contribute to such
unified effort with clear destination rather than random projects used
by a fraction of the community. It seems that lots of current efforts
suffer from an inability to get enough resources behind because of an
unofficial status. If we discard something based on the implementation
costs, it would be useful to make that an explicit informed decision.
Implementing something solid from scratch may actually be less effort
than trying to connect together two pieces that were never meant to
work together, it's important to consider short term vs long term
costs here.

But for this final destination we also need to figure out concrete
technical foundations: email vs git vs ssb vs forge vs something else;
identity/user account story, etc. But it's not just picking one name,
because e.g. for ssb it's currently unclear to me how to deal with its
inability to provide global data consistency. But git-based solution
has comparable fundamental problems too.
Without these decisions we won't be able to make any actual forward progress.
