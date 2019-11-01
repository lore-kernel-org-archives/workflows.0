Return-Path: <SRS0=NMkj=YZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5BFCA9ECF
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 21:34:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4C00217D9
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 21:34:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C0O37GOr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfKAVeo (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 1 Nov 2019 17:34:44 -0400
Received: from mail-qt1-f170.google.com ([209.85.160.170]:43506 "EHLO
        mail-qt1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfKAVeo (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 1 Nov 2019 17:34:44 -0400
Received: by mail-qt1-f170.google.com with SMTP id c26so14840190qtj.10
        for <workflows@vger.kernel.org>; Fri, 01 Nov 2019 14:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E0OnGzkc5FkfzZrkCzKEfBYvdiZRpqFJ/gJQFoYM1FY=;
        b=C0O37GOrnt1soSChq0/X7i93O4rab5j1bg93tutJ7ziamon0R/ZLYNmivJEY3xJZf2
         4OXcKQIL9JACdQMcr3gdN2WMZiYdjHYUtpt688x4tgVUUQAZaWXQ+5t2Nwgccqq6SkIV
         1I8tqs1aTxFwKW2sOJ1Z+zkmDU9T+y+a3wEAOmdLQsoHS9oFERek5/At4bWOGNbhHjXL
         Mr85QfolhHNE2eQM7XIqROn7UBVhzTxR1SOmXbH1JO9BRmpRjMkqQ7Cf3TX+DkFQY7X9
         Gj34KwuF5b3vpgewcS/iIwT5jddnCZW5o5U4h89M400nzjimd9fqRh4mX4PDO6YT/Ji3
         +rFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E0OnGzkc5FkfzZrkCzKEfBYvdiZRpqFJ/gJQFoYM1FY=;
        b=q5ZvVwMXrpIe7VI/J7JYb5AvcEEISLHKq046qe98Gf4cxmZ2dtmh24Ro0Btyq1/YnA
         C1XHlXFr1Sbs1dHnRVmBPaMMTphkNPjga4uxp8W6Gfr0T8uE+KGQxorBoH7lTOhnXITt
         yks5NNUZPLPdABpOpKv+vLzgi2cxaZ4pHixqoMMyeaSZVL4K/tBSTm1Xeyu1RpSiYoaG
         WsDzOPLaMBXkWStkpTzeBY8JHgINkvW+Ipp+uW4JP8LThtptDS2zp2cmVYR2cUKQXmqT
         tAjvXIUtNPJjfk/tU2BRTkCeH+bsprbBNEEn0khOZ8//aqVutdGtFLIvNhps3AS31XNz
         dePg==
X-Gm-Message-State: APjAAAUC81uyCdXtgoJ4Zz7t1iHv7zFuhc101wZksRuGMylVcap4H/uw
        BhL8IhyCe0L88VtIfAQQJ+s6ie3z7ZN01dgaG3sUpeIAHPYAXw==
X-Google-Smtp-Source: APXvYqwXS3XWhXvioDgqb4GsvFXNdUaKpnBjlPJtDz69puCu/i5WYOXHNb4jdtCb4Cx1nCS7LFtu9GLbpwsh64HwL+g=
X-Received: by 2002:ac8:4157:: with SMTP id e23mr1645845qtm.158.1572644081313;
 Fri, 01 Nov 2019 14:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191029222629.GA19318@dcvr> <20191029231313.GA124865@google.com>
In-Reply-To: <20191029231313.GA124865@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 1 Nov 2019 22:34:29 +0100
Message-ID: <CACT4Y+bY6xRH-y5jqXc84MTxBahN4WWJVAdPraTC74NgnTkzyg@mail.gmail.com>
Subject: Re: Lyon meeting notes
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Eric Wong <e@80x24.org>, Han-Wen Nienhuys <hanwen@google.com>,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Oct 30, 2019 at 12:13 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Tue, Oct 29, 2019 at 10:26:29PM +0000, Eric Wong wrote:
> > > https://docs.google.com/document/d/1khLOBw5-HyaaNX7xregpHQLSfvGDUeHDY921bkI-_os/edit?usp=sharing
> >
> > Thanks for taking notes.  Is there a version accessible to users
> > without JavaScript?  Thanks.
>
> Here it is:

FTR, here is LWN write up:
https://lwn.net/Articles/803619/
