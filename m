Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41380C433EF
	for <workflows@archiver.kernel.org>; Mon, 13 Dec 2021 15:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234717AbhLMPsn (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 13 Dec 2021 10:48:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60683 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232990AbhLMPsn (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 13 Dec 2021 10:48:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639410522;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IV4BO7B6yRtpQAFfUjeQT43a5PEDg6w6ldV2wUben9c=;
        b=g9KKZZEsLsjDbZm0Z/QXno4dk+N+4SnpV9gZmYikwUq8sYzuG3Hszj2cz8jlDIFEBNm8eF
        a+JthanVr+YGRUrkLE8pcpi2jvlD0+tGmMbgOUB/MBdeIUjPY/5BGkaO1RPbi1fZpszzwY
        IB0ipOfmzLFIYeb86/7fy3vJMLZ4I7Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-sZ-ge32VMgCC8I5VuwFDZw-1; Mon, 13 Dec 2021 10:48:40 -0500
X-MC-Unique: sZ-ge32VMgCC8I5VuwFDZw-1
Received: by mail-ed1-f70.google.com with SMTP id m17-20020aa7d351000000b003e7c0bc8523so14315071edr.1
        for <workflows@vger.kernel.org>; Mon, 13 Dec 2021 07:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=IV4BO7B6yRtpQAFfUjeQT43a5PEDg6w6ldV2wUben9c=;
        b=ZPEfi5hi2uBwOjEupZD9W7K0+SVmhrGwjVtuJY9cQSMcv3t5aAyARq5k1K0Uetw+NP
         YawdODVjzTJndI5VmEIi0qaTWx1aKQMwTGlq9sSuKI7r5i7xAd/B0iaNLVC/wcFhD3uk
         W/rXZxsooGf+wr5m5fa39vqnu+LCRz7Sv7gwN/h6sy+gtU/Z/GDB/VmXfzbV3fSUm+fB
         IbXjbvME0TXhJcAo5ypHIJwUoz3wPPMvgmlSqnMYgFZ0nb5asO/iO9fM9A7bSBCzfKYu
         qR9r+64YBpEZB8VCaUgkNr6eqT9sUnIMNHOojkJc/HHaNEdrIDTPWrHd2uhWBWNGe8LA
         Bq0Q==
X-Gm-Message-State: AOAM532ckFMtegzQkOH1kpVxuZxlfZ7DAP+HQheLJvZgDNiUlyBSpSsG
        PYsViQcrDRKDO4VVwhlEet3gViWcNIF9Y6nm2IYGP84Qblkcc3/8gd0JQrTwqzfXAu1TVhMO6Nr
        WTcpZZIS6AxWpGs6i34rj
X-Received: by 2002:a17:906:730f:: with SMTP id di15mr45063136ejc.22.1639410519003;
        Mon, 13 Dec 2021 07:48:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2h3EVKqMXQ7jseORMd4QkgR+7MuMQIHBd9FHdivD7onfHIUP0F3VVs8l1cf8O1cx191kDCg==
X-Received: by 2002:a17:906:730f:: with SMTP id di15mr45063099ejc.22.1639410518654;
        Mon, 13 Dec 2021 07:48:38 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id nd36sm6159788ejc.17.2021.12.13.07.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 07:48:38 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 622D9180496; Mon, 13 Dec 2021 16:48:37 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     workflows@vger.kernel.org
Subject: Re: Monitoring the status of your own patches on patchwork?
In-Reply-To: <20211213070840.4353fd6d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <87mtl7ufl3.fsf@toke.dk>
 <20211213070840.4353fd6d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 13 Dec 2021 16:48:37 +0100
Message-ID: <877dc8fqui.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> On Sat, 11 Dec 2021 20:06:00 +0100 Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Hi everyone!
>>=20
>> I was wondering if anyone had any nifty tricks or utilities to help
>> monitor the status of your own patch submissions on a patchwork
>> instance? Things like getting a notification when a patch changes status
>> or when one of the automated checks on that particular patchwork
>> instance fails for a patch you submitted?
>
> Status notification when checks are failing? Hopefully not, we don't
> want people posting patches just to get them tested...

Well no, but sometimes a patch will have failures despite the best
efforts of the submitter (otherwise what's the point of the checks?).
Right now the only way for me to discover that there's an issue is to go
look at the patchwork web interface, and I wanted something that better
suits my workflow (i.e., that's not in a web browser).

I wasn't asking for patchwork to send out automatic notifications
(yikes!), I just wanted to know if anyone else had done something
similar before I go play around with the patchwork API myself... :)

-Toke

