Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D61FA372C
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 11:58:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF1DE215EA
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 11:58:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="l7Q3xD1N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388049AbfKHLoq (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 06:44:46 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:42983 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390878AbfKHLop (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 06:44:45 -0500
Received: by mail-vs1-f66.google.com with SMTP id a143so3562726vsd.9
        for <workflows@vger.kernel.org>; Fri, 08 Nov 2019 03:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=5L1vhe0xDFdjggIG8KdBl+IGeL5Kt8fTSeYrn4f7Y+A=;
        b=l7Q3xD1NheJMVKyayBNIOrHlhCHletYIiVKvEbEa0FI1dCVB3lWfkJ8n5T1NnzxI1H
         J+ERDKpmm5/En1vE25zSVwuZQ3Nwa6QXickZ2CfZzhRa33PKWZ6wPk4tKZsP5Ai9JlUp
         g0nilAL9IO7PYqkEQFmNDxe1nOw4ebsG/eiwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=5L1vhe0xDFdjggIG8KdBl+IGeL5Kt8fTSeYrn4f7Y+A=;
        b=G0PDHWKHg9NjzdmvrpJatRKfwThtR8d0iml1zQ5oMxIBlFQorU4XH7/YkzKy8xED7n
         HWp0RvVi+FNppb5DxPc/WVAFYAw4eH3jca+6BhnlGQPl+29cjXOPXi6jkZGPqnv4bS77
         LdhLcNrH3I/FHy814DAplFIjp6Hw2JPMgILZzsFgi/oD7LoJAD5rNuB6TTfxIhuKnQSn
         y8ta81s4Q46ojz2wcO6iBxK4IkXxD4lFafLfLolD/yagR5NEcvkQUFYA4VY9L3VB1WS0
         WyaNQjG+/TAoxiXAIjp0zcGrPixEoaXu4KTam3yRFao0ZSXap4XPkrGbGliloIGIEUQk
         1ZBw==
X-Gm-Message-State: APjAAAWjKP6mBnjH0BfbtQdcCwwRZwtciHcaJYLnV1cV7RUbT26Zdo7m
        j6RA9vym7/8L9kQTnHniVh+F85ubXD4=
X-Google-Smtp-Source: APXvYqxbTqiEBjj2wCJJJObxu9sdOCjkyBk/YLBi2VAiNaG1rQdUKh7tMEShkahdKeeo4nZMniehQQ==
X-Received: by 2002:a62:7dce:: with SMTP id y197mr11374433pfc.164.1573213482255;
        Fri, 08 Nov 2019 03:44:42 -0800 (PST)
Received: from localhost (2001-44b8-1113-6700-40d3-eca3-e70b-6bc4.static.ipv6.internode.on.net. [2001:44b8:1113:6700:40d3:eca3:e70b:6bc4])
        by smtp.gmail.com with ESMTPSA id h3sm4570268pji.16.2019.11.08.03.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 03:44:41 -0800 (PST)
From:   Daniel Axtens <dja@axtens.net>
To:     Don Zickus <dzickus@redhat.com>, patchwork@lists.ozlabs.org
Cc:     Dmitry Vyukov <dvyukov@google.com>, workflows@vger.kernel.org,
        automated-testing@yoctoproject.org,
        Han-Wen Nienhuys <hanwen@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [Automated-testing] Structured feeds
In-Reply-To: <20191107204356.kg3ddamtx74b6q4p@redhat.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com> <8736f1hvbn.fsf@dja-thinkpad.axtens.net> <20191107204356.kg3ddamtx74b6q4p@redhat.com>
Date:   Fri, 08 Nov 2019 22:44:37 +1100
Message-ID: <87k18ah9sq.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Don Zickus <dzickus@redhat.com> writes:

> On Thu, Nov 07, 2019 at 02:35:08AM +1100, Daniel Axtens wrote:
>> > As soon as we have a bridge from plain-text emails into the structured
>> > form, we can start building everything else in the structured world.
>> > Such bridge needs to parse new incoming emails, try to make sense out
>> > of them (new patch, new patch version, comment, etc) and then push the
>> > information in structured form. Then e.g. CIs can fetch info about
>> 
>> This is an non-trivial problem, fwiw. Patchwork's email parser clocks in
>> at almost thirteen hundred lines, and that's with the benefit of the
>> Python standard library. It also regularly gets patched to handle
>> changes to email systems (e.g. DMARC), changes to git (git request-pull
>> format changed subtly in 2.14.3), the bizzare ways people send email,
>> and so on.
>
> Does it ever make sense to just use git to do the translation to structured
> json?  Git has similar logic and can easily handle its own changes.  Tools
> like git-mailinfo and git-mailsplit probably do a good chunk of the
> work today.
>
+patchwork@

So patchwork, in theory at least, is VCS-agnostic: if a mail contains a
unified-diff, we can treat it as a patch. We do have some special
handling for git pull requests, but we also have tests for parsing of
CVS and if memory serves Mercurial too. So we haven't wanted to depend
on git-specific tools. Maybe in future we will give up on that, but we
haven't yet.

Regards,
Daniel

> It wouldn't pull together series info.
>
> Just a thought.
>
> Cheers,
> Don
>
>
>
>> 
>> Patchwork does expose much of this as an API, for example for patches:
>> https://patchwork.ozlabs.org/api/patches/?order=-id so if you want to
>> build on that feel free. We can possibly add data to the API if that
>> would be helpful. (Patches are always welcome too, if you don't want to
>> wait an indeterminate amount of time.)
>> 
>> Regards,
>> Daniel
>> 
>> 
>> -- 
>> _______________________________________________
>> automated-testing mailing list
>> automated-testing@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/automated-testing
