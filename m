Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A032CC433F5
	for <workflows@archiver.kernel.org>; Mon, 13 Dec 2021 18:39:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235987AbhLMSjd (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 13 Dec 2021 13:39:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43005 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230346AbhLMSjd (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 13 Dec 2021 13:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639420772;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=49rXU22wc7i0dic4SM+lnP3tbz11LX157HFZA+atEF8=;
        b=JnyN3ZAhmHk9fmhF2MkROhwsjZpYI4/neszRqOeR/zkT3MrS36yRjC1yTTRIoR+ISUYYoU
        pO5ejhafxTwwTHdZrq1R2YZJa+i7IlpAZtM96NkNqZoiPPU2ycrUzWQpDB496A3xbYJqTk
        5smagx286uN0gYa82mbyVZzAw69rsoM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-514-cgI_f1nRPFSZNFQHvxgA3A-1; Mon, 13 Dec 2021 13:39:31 -0500
X-MC-Unique: cgI_f1nRPFSZNFQHvxgA3A-1
Received: by mail-ed1-f70.google.com with SMTP id w18-20020a056402071200b003e61cbafdb4so14764501edx.4
        for <workflows@vger.kernel.org>; Mon, 13 Dec 2021 10:39:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=49rXU22wc7i0dic4SM+lnP3tbz11LX157HFZA+atEF8=;
        b=WSDjz7yaYw1/sHLyFhf9FVnZ3SEIP6nY8pjxgexgbfAqaWWGzyJ+NeGhwvyePq3Rvs
         9Ru9xQMTRKjDbKqX/t5n9znteolyNieN/cCk5UIVx7EdWUptRS5CR4zuTICEGyT6xlJt
         fIwHuHe6e0g0V41jtkBN3mAaRuJISxgk6SNvcGrEQX7I5SPjWl4UZN0WSpUjaCDxxoBH
         IASOwiVo2FoJCkw4LWstf/U2M4dF/aNNctzyibtua8K1rraRXgwxNrMcFXav0Kgz0qgp
         FbsNWdeb1gktWb8hesK3xFdTyilYywZU3itP4GlgEd0lJcef4jP98pk7WlGhXEXQzTv1
         zjAA==
X-Gm-Message-State: AOAM531jaQGv0w+xBCv1hOsjEB6a2GXqCzP43vnsZDmikOA/XW2Eea8l
        U8TjX1im5dZpGxMk8JV0d1cd6/6wjI7mYaJFGJACIl5fAyjsKF90vYjiLeWVtw6fj0AlemDtMwx
        ufrVEfQuh+qYZIhvf3RfI
X-Received: by 2002:a17:907:72d2:: with SMTP id du18mr156961ejc.570.1639420769408;
        Mon, 13 Dec 2021 10:39:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/AkupvdmtQKtJ7U+JU0mO830L2XUbus/qJaY9AaL8G+oiTnWVXmvrCMy1vvKDYOtRQE9Yxg==
X-Received: by 2002:a17:907:72d2:: with SMTP id du18mr156935ejc.570.1639420769019;
        Mon, 13 Dec 2021 10:39:29 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 24sm57972ejg.47.2021.12.13.10.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 10:39:28 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id CB26D18043F; Mon, 13 Dec 2021 19:39:27 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     workflows@vger.kernel.org
Subject: Re: Monitoring the status of your own patches on patchwork?
In-Reply-To: <20211213080625.7febffc2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <87mtl7ufl3.fsf@toke.dk>
 <20211213070840.4353fd6d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <877dc8fqui.fsf@toke.dk>
 <20211213080625.7febffc2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 13 Dec 2021 19:39:27 +0100
Message-ID: <87zgp4z6w0.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> On Mon, 13 Dec 2021 16:48:37 +0100 Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> > Status notification when checks are failing? Hopefully not, we don't
>> > want people posting patches just to get them tested...=20=20
>>=20
>> Well no, but sometimes a patch will have failures despite the best
>> efforts of the submitter (otherwise what's the point of the checks?).
>> Right now the only way for me to discover that there's an issue is to go
>> look at the patchwork web interface, and I wanted something that better
>> suits my workflow (i.e., that's not in a web browser).
>
> I think that the maintainer should notify the submitter about=20
> the reason the patch state was changed (with the exception of
> patches for a different tree, maybe). I know Kees has been=20
> trying to add more meaningful states to patchwork but I can
> never guess the meaning of those either :S So no automated
> state checker can replace the maintainer's reply.

Well, sometimes the maintainers forget to reply entirely :)

And yeah, I do realise that no bot is going to be able to tell me
exactly what the current status is, I just want a tool to help me
manually keep track...

>> I wasn't asking for patchwork to send out automatic notifications
>> (yikes!), I just wanted to know if anyone else had done something
>> similar before I go play around with the patchwork API myself... :)
>
> Despite the promise of "best effort" I fear such automation.
> It's pretty common in (let's call them) modern workflows to
> submit PRs / post changes just to get them tested by a CI.
> We don't want to give people the impression that the mailing
> list can serve this purpose.

People could already do that, though, they just have to look at the
patchwork site. And I really don't think it's that convenient of an
interface that this is a real risk. But don't worry, I'm not planning to
publish this as a generally-available service :)

-Toke

