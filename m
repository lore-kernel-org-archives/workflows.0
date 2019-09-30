Return-Path: <SRS0=YmVK=XZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2569DC32792
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 10:39:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD798216F4
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 10:39:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i2Rg9IOq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730679AbfI3KjM (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 30 Sep 2019 06:39:12 -0400
Received: from mail-qt1-f177.google.com ([209.85.160.177]:33310 "EHLO
        mail-qt1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729870AbfI3KjM (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 30 Sep 2019 06:39:12 -0400
Received: by mail-qt1-f177.google.com with SMTP id r5so16382130qtd.0
        for <workflows@vger.kernel.org>; Mon, 30 Sep 2019 03:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hO/Ho/Ld5TGE+AXtF7we8CSNxOMhq0UUt1X6JKPmALI=;
        b=i2Rg9IOq7X6Vzma07P/kBz7fkyzRm5H9ZD4uIQmh9A2E0ywcmdqpCyfplDL3WQykom
         ZSnCZZTkW0fBCLNhrzJNcDukV+z2CxDrWz1ocAqbKJmLo8EoJbKjTQMpb1fzEXBYIrFm
         RuEP5BjimLwv9jwy9E3K1Wm6vuv9IzFu+Ju9kNz0MZPG7YsFbVEsPC5cPKzDvjA8tSrE
         HOJx3U5Aio70J+1irnW15Mji162TSP65aqykUAkdKD55XaGp/oX197YYEik7dvP6jaCS
         29bn7RWu8VTH0GsIU9mIYUr2FEGPwTC4jM2g13mMwF5epdqTsEWgQ/OpUAgt7lczHHzd
         YeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hO/Ho/Ld5TGE+AXtF7we8CSNxOMhq0UUt1X6JKPmALI=;
        b=tB/ioTMLGtxWcDEnA0e13l5HC0MHbAZoeexZjfvyf2+fOwysBoE189G+VnhpPH7qGF
         1jmPTNQ7xdxq4kvL+6I4XtMHoF0xixasdBTS2U5FEmTkWUHrH/yXq7jcwBdsR175v1dI
         +0Ne/Wa9VbSHFm/v1klTVi0Zs+8ktiWuAneYUI6NaHBv6JQ3cARo9mmOGr0A0vOovqpv
         TmnTYZecOLrsj4ueOBkWd//gCONzU01rAvsxRrkbYHAeG3AHO/K6S2gR8Az6/az8lzwk
         iAmIeoEXkyqexJ3RuLPUSKM+k8dHD2ESweJoeGrP/44hIUSuy/4iG5STgFLZrQR9PH2g
         IA4w==
X-Gm-Message-State: APjAAAUpSTbD40T/AcukNvwjN78TZhORQ5up7d7nt3BarRqFuT9iehyh
        KmadIAVOXfTouArCm38t4wiiJCDpD0yX0aVk3JvwU6oDVao=
X-Google-Smtp-Source: APXvYqzrF8sCqkPd1L04ilgcQ/gC5+U9JEMnvR/2NF+PEzFtSjOIUHpZd/E3BqD3UmgWccM9eg10p5K76miA82sBh9s=
X-Received: by 2002:ac8:108b:: with SMTP id a11mr23731378qtj.380.1569839951114;
 Mon, 30 Sep 2019 03:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <c247f8eb-c324-30d3-b41d-02afe1dc829d@google.com>
In-Reply-To: <c247f8eb-c324-30d3-b41d-02afe1dc829d@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 30 Sep 2019 12:38:59 +0200
Message-ID: <CACT4Y+ZtRL_4nfOTWH74ddv4UMiQc9v-o0C8D5s_PFsJT2VBeA@mail.gmail.com>
Subject: Re: Ideas from Jane Street's code review
To:     Barret Rhoden <brho@google.com>
Cc:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Sep 26, 2019 at 5:06 PM Barret Rhoden <brho@google.com> wrote:
>
> Hi -
>
> Jane Street did some interesting things with their code review and
> workflow, such as handling diffs-of-diffs and tracking what needs to be
> reviewed.
>
> Their ideas might be orthogonal to the whole "workflow that works for
> email / web / your-tool-here" discussion, but some of the underlying
> principles may inspire a good overall design:
>
> Tech talk:
> https://blog.janestreet.com/jane-street-tech-talk-how-jane-street-does-code-review/
>
> Links to their blogs:
> https://github.com/janestreet/iron


Interesting idea of editing, saving and committing comments along with
the code into review branches.
Added it to the list for completeness:
https://github.com/dvyukov/kit/blob/master/doc/references.md#iron
Thanks, Barret.
