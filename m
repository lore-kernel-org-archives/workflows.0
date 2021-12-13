Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1270C433F5
	for <workflows@archiver.kernel.org>; Mon, 13 Dec 2021 21:43:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243146AbhLMVnd (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 13 Dec 2021 16:43:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31884 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242947AbhLMVnd (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 13 Dec 2021 16:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639431811;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uZNBofLPsex/N0jt4bVE15SAKDkldNPqYel0M7Qpdow=;
        b=UtmdqrnkPE2pxXLnp3ABozfZUDAqOTHDKnrMb3w6LB5Oe0XilMLJRhlK3nuOOIoIQkYiSg
        VHyGLFy1dLwAtcDBmUwIQl1i9mSsulYnMdg9xmNvdvYftdpuhfzw9pq7yF9YRqmy6rGEu/
        hFftg47oLFAvOSfXGhoRdDsc5VWKeYw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-0U8P3BQpORi6hnfNKS_CrQ-1; Mon, 13 Dec 2021 16:43:30 -0500
X-MC-Unique: 0U8P3BQpORi6hnfNKS_CrQ-1
Received: by mail-ed1-f69.google.com with SMTP id q17-20020aa7da91000000b003e7c0641b9cso15105748eds.12
        for <workflows@vger.kernel.org>; Mon, 13 Dec 2021 13:43:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=uZNBofLPsex/N0jt4bVE15SAKDkldNPqYel0M7Qpdow=;
        b=GV+EqrgkgyxcXuuaavjPT5iznVWF7y5yn0Um/uAaMzgeUZasPZ5Ka7C+ahOuKq/Kxz
         ewi/2JOx8JWTmZe5aQX8nSv9jJnn5m0zo+VYSkgXfUQxqdDMotox9V6DmbqDcqV9dfI1
         aiieIFarRBTkJHFZMEmKbJMQ/jJdyfWKaJLSMau5PZ+B2m2mWq5nRn1gkDqXa0r77Y99
         Dp5NfW8PzKP5ZUW87kwkf2eENpDD122jWTG+065RCZeEdmvj1NBYPFPHKR/7517Gv2kE
         HGSWWq0xR3EAD3thEd259ctoXJ2JEGNQMg3PEW5xcRzX8L7hw/StW1UqsRH+A4V0W74U
         Shxw==
X-Gm-Message-State: AOAM530+waky9suQvjug8204OzpnuK3iDdcVX6nTEhNRgMmSfxMFdbQi
        ZBMeho8AfteqZA61Mnvf8LXyVFpRNxi4OaqbglT+YkG+/5VS6vw4A/cZ7635Myf8jmrGBT0/NIl
        JJgao62eN9lNUxNRVYGqq
X-Received: by 2002:a17:906:dff1:: with SMTP id lc17mr1003126ejc.215.1639431808699;
        Mon, 13 Dec 2021 13:43:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfg5dPNwfagXcnDgCvGr2/4G6GAjcDOk7KURXxtUyYQWAxUUyNeZwUw62zFx3ypQWKzRdfAA==
X-Received: by 2002:a17:906:dff1:: with SMTP id lc17mr1003059ejc.215.1639431807963;
        Mon, 13 Dec 2021 13:43:27 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id t3sm6814366edr.63.2021.12.13.13.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 13:43:27 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id BEAA8183566; Mon, 13 Dec 2021 22:43:26 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Simon Glass <sjg@chromium.org>
Cc:     workflows@vger.kernel.org
Subject: Re: Monitoring the status of your own patches on patchwork?
In-Reply-To: <CAPnjgZ1THJQSUj2Mmq2P6EtJXZQV=th0vnN2cLZ=BZe_sck+SA@mail.gmail.com>
References: <87mtl7ufl3.fsf@toke.dk>
 <CAPnjgZ1THJQSUj2Mmq2P6EtJXZQV=th0vnN2cLZ=BZe_sck+SA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 13 Dec 2021 22:43:26 +0100
Message-ID: <87r1agyydd.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Simon Glass <sjg@chromium.org> writes:

> Hi,
>
> On Sat, 11 Dec 2021 at 12:06, Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>>
>> Hi everyone!
>>
>> I was wondering if anyone had any nifty tricks or utilities to help
>> monitor the status of your own patch submissions on a patchwork
>> instance? Things like getting a notification when a patch changes status
>> or when one of the automated checks on that particular patchwork
>> instance fails for a patch you submitted?
>>
>> I can just filter the patchwork web interface to my name, of course, but
>> I would like something that can be automated so I can make the stuff I
>> care about show up in my inbox :)
>
> I'll just mention 'patman status' here, which collects tags from
> patchwork so you can send them with the next version. It also shows
> you code-review snippets on the cmdline which I find much faster to
> process, particularly for large patches. See below, although it's a
> bit hard to read without the colours that patman uses.

Ah, this is cool, didn't know about patman! Will take a closer look, it
seems to be solving some of the same issues I've been rolling my own
solutions for - thanks for the pointer! :)

-Toke

