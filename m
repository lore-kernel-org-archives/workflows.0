Return-Path: <SRS0=PtRO=YK=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96810FA372A
	for <workflows@archiver.kernel.org>; Thu, 17 Oct 2019 12:10:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 665B320854
	for <workflows@archiver.kernel.org>; Thu, 17 Oct 2019 12:10:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J0COOo8v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389504AbfJQMKC (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Oct 2019 08:10:02 -0400
Received: from mail-vk1-f174.google.com ([209.85.221.174]:33103 "EHLO
        mail-vk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731634AbfJQMKB (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Oct 2019 08:10:01 -0400
Received: by mail-vk1-f174.google.com with SMTP id s21so456223vkm.0
        for <workflows@vger.kernel.org>; Thu, 17 Oct 2019 05:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0T2ZuPGPWjOicXDJ5Yyt2JfXzS5ezeJW+s3zGW0d14c=;
        b=J0COOo8vnCUTWyST7bGlrpz7iQkvwyhG5tPAcRlp+Y+1JO90xOdwKDdtOMBBB3up7X
         zcxDdekYLKVcdceq+qmBjaGzEiMKxw0Ct9Kr/CC49VWMITgYcKpgG4IAkYEhY97aDDFh
         AovqmdBGiG7d4bvQwapNCVl2KkD2zhWAr1IAQvZeiG9f+fMM1PCVzr2N5kM6FFEQtu0J
         ViArcoqHn17WQwWt9lhxxSzvrJgq7XC8OIdru4HsGwzPiv/vB4Lk7/O9/7ZKN7fHIWo0
         qXberf1mjg+gr0fM7Q3fXqzjnAnUeVGgPQUcwrbbe6lvQurcy41yuSPXaxMI1zJpIvKS
         CLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0T2ZuPGPWjOicXDJ5Yyt2JfXzS5ezeJW+s3zGW0d14c=;
        b=fxK+qcBPKWeFyYAThZ5oeFM0XtYr/ziM+Pr6MIOI95pdY9XoPFTU74qggXPiYVGgwH
         p6CNgm26ns4U9gXB4YZW3JRL9TaIxjHqtgJ8b+R0XBtDCfGpPKLUwWcryvmHYosr7qO3
         MEZeRHhtBbWsp0G9PlI53zx4GnIymZ8mhyKqikc6jR16T/SHd1PSQ9fwc+xX0655ND/W
         2grdIk1wvk10lTuhxFOV8kERArEt3VVU97Irhr5wj7CDvah3G/1y9cptNVkI9lK+NglT
         1KALfERT8snU5qFdgDSNQVfHNCOKea3L0twm0EDzSVKpMM9umjriQITS9ViPYUpOmURY
         lkPQ==
X-Gm-Message-State: APjAAAXfvNdQZuKJdPLbQWAD2whQ7frtAMlC49BiVbtYWjB1qYPCNPFK
        UtBTrddnfE8ULd/8wgHDnsMVoPVNUzT93x9uwJy5fw==
X-Google-Smtp-Source: APXvYqyibKqNKBgGyfYArVxswWAuAuljQqq+sP45zYbEyKtS1p/2msILto4CCO8IXczxUQrdKBKKFEul27C2xrH5jFM=
X-Received: by 2002:a1f:9685:: with SMTP id y127mr1683846vkd.31.1571314200183;
 Thu, 17 Oct 2019 05:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191007211704.6b555bb1@oasis.local.home> <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home> <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local> <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local> <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu> <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015015425.GA26853@mit.edu> <CAKMK7uGtvqFSw+wOBeGjV88DeyUoMTV3+F4Fpqv6NGUBCkAAgA@mail.gmail.com>
 <CAFQ2z_Pxc=0LjEieUC7Dz_sQiUKBr2oKUVrW7Fppj5AQbD_W5A@mail.gmail.com>
 <CAKMK7uGseMAmmLkawkaMMJgK=XAXoK+vOP8Uo9obXpss_v+WYQ@mail.gmail.com>
 <CAFQ2z_OVwS0Ups1QCEvJBFTsZmsw1u25bJh+a3xArjhXggLqcA@mail.gmail.com> <CAKMK7uHvcc4WvswnWMaiT+B7NV==DWB5MGj4KSkOMSukE+4=OA@mail.gmail.com>
In-Reply-To: <CAKMK7uHvcc4WvswnWMaiT+B7NV==DWB5MGj4KSkOMSukE+4=OA@mail.gmail.com>
From:   Han-Wen Nienhuys <hanwen@google.com>
Date:   Thu, 17 Oct 2019 14:09:46 +0200
Message-ID: <CAFQ2z_NdqD5oj6QLqFD+E_KnW7E9cJKdMhQCe5CQ4qsOjR3PPQ@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Oct 17, 2019 at 1:50 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> I'm not saying you're having no reasons to do this. All I'm saying is
> that outside of the kernel, there's not really anyone doing it like
> the kernel, mostly because the popular tools just don't really support
> this workflow.

Fair enough. This has been a hugely elucidating discussing; thanks for that=
.

I had some thoughts about something that resembles what I think you
are looking for. I wrote them down here

https://docs.google.com/document/d/15OzXgmZ_yQ7UHnMUeiK3AB4tgQauJde4pzStCv-=
mIYM/edit#

I think this could be made to work, but it would be a considerable effort.

--=20
Han-Wen Nienhuys - Google Munich
I work 80%. Don't expect answers from me on Fridays.
--
Google Germany GmbH, Erika-Mann-Strasse 33, 80636 Munich
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
