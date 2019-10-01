Return-Path: <SRS0=W/h6=X2=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C256ECE587
	for <workflows@archiver.kernel.org>; Tue,  1 Oct 2019 21:15:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D64DF21855
	for <workflows@archiver.kernel.org>; Tue,  1 Oct 2019 21:15:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkQbox6N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbfJAVPF (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 1 Oct 2019 17:15:05 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:42579 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbfJAVPE (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 1 Oct 2019 17:15:04 -0400
Received: by mail-io1-f50.google.com with SMTP id n197so51756242iod.9
        for <workflows@vger.kernel.org>; Tue, 01 Oct 2019 14:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=C0wW9G9XtmK1EH5yNacNq6FJAL1xQhglaZCZ6ZXiejY=;
        b=SkQbox6NeqDnf7W8P5aIRh0qq38vpII1gH3lzbqDR6VjMG7TG3nfMFOKELID/kyyJF
         cPwRfb5ZwHCjoGnuddfSRnAJevYKtRAmvmci+D8eJvz7z466chWo2IsrTJMFK3TDhbVg
         CPSNYvPQwnl8lfCQUsNBHeB1npd0JVWYcpUoJsLA1p0yOYFLLOWTF30UoZOUQCpm9hjk
         AOm6A5kM3snOtttjX43EAtXBoBn4YigPrI8KxXt/MajnVNoa6DlbDCeCDSjT4UZJMmNe
         TaiKMGRm7wMRkxtmEVdbBja5QIK2txa2j0Z6XZQfhryO/PybA3DiXmXCmT10vxC4SU1v
         5RxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=C0wW9G9XtmK1EH5yNacNq6FJAL1xQhglaZCZ6ZXiejY=;
        b=RsVoZLB+l5AQEJpB0KzL3NJGEm57Upv26txysrp+vwA75alndKPu1rIE8zwLADnaH+
         zLp9SfKB7clac04Voy9MCEgX+FhrTEM6RqG8T0KOBZNymv62lHwnttwAEx0Fc+NjUDXJ
         rQnPHwNJZixnGhMVaacXEakFXSzaNgOCFi3sCpgJvPJ2VzGNlqtdRQxB/RjL5jDXkhH6
         WXqOeA40QiOmlrcUWTRgf/rKdapMEaAE9rH7Oo8vdaT+o1gY1UBxzYVHUxP3vK6qMAi8
         1M0cmm5H57qwE750zc8olEZcV+0Fz1RwACPEuX4GkhfrXdquVUj3iynPXR3t5T7DH4lK
         HdeA==
X-Gm-Message-State: APjAAAXMMc+tZaWvggISsmOuZaIuE7Ecrhho3+WoqsvA7O9vSRf+Thiz
        NYiffGwml+M7NkL6Lsvmlz0nS7VUUFxvGSeJeuk=
X-Google-Smtp-Source: APXvYqyyAb8rXr8fjk9LBRC4hQ65BPCBHFw/vAFtaHHPP7guTb9wJhaQXqRiFeBjXqaJF/aLt7+u0OFzN6TLtrJY9RE=
X-Received: by 2002:a92:b612:: with SMTP id s18mr52978ili.37.1569964503458;
 Tue, 01 Oct 2019 14:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura> <20190924185312.GD6041@hmswarspite.think-freely.org>
 <20190924202423.GA14425@pendragon.ideasonboard.com> <20190924222502.GA11633@hmswarspite.think-freely.org>
 <20190925205036.GA7763@pendragon.ideasonboard.com> <20190926004045.GA20302@localhost.localdomain>
 <20190928185848.76c85a9d@oasis.local.home> <CAPM=9tzbwop5Wv9u5d2rDz_-eUmfckJdYff4WVnmAZKf-yBXXw@mail.gmail.com>
 <87eezx40bi.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87eezx40bi.fsf@dja-thinkpad.axtens.net>
Reply-To: bjorn@helgaas.com
From:   Bjorn Helgaas <bjorn.helgaas@gmail.com>
Date:   Tue, 1 Oct 2019 16:14:51 -0500
Message-ID: <CABhMZUVi0k0b5ezcuL-SbYsWTLuLjPb0iQB0+o+4AH3NATH9aA@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Daniel Axtens <dja@axtens.net>
Cc:     Dave Airlie <airlied@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Neil Horman <nhorman@tuxdriver.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Sep 30, 2019 at 10:22 PM Daniel Axtens <dja@axtens.net> wrote:

> What sort of manual interactions are you doing with patchwork and what
> would you like to see changed?

I delegate patches and change their state.  This isn't a lot of time
in absolute terms (10-20 patches/day) but it's frustratingly fiddly
because of mousing/clicking and web latency.  git-pw seems like a way
to get rid of this, but delegation is currently broken
(https://lists.ozlabs.org/pipermail/patchwork/2019-September/006036.html)
