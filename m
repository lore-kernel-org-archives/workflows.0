Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96929C433EF
	for <workflows@archiver.kernel.org>; Sat, 11 Dec 2021 19:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbhLKTGI (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 11 Dec 2021 14:06:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20302 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231765AbhLKTGH (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 11 Dec 2021 14:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639249566;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=lSd/JXczLfMK24lTXIJAZhvB5blqV1dy9LZ8oYqzc2w=;
        b=W6jNvmMwU82OKlCXF/co2DUAweTWg+s5P3y21nDl2cGBltslrQk/EXnCcXA/jyaJUChTIL
        V+m6RQuCTOHyE6fK0wJnKqg2BqhfZk9wsNE57ptJiv2zV9C8iKD+N5ooBDkQyQ042IySct
        WeKxJGpHZXAlFbz3OOlyT9131YJpyjQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-RGFpQCYRNnmBMFd4jzzYGw-1; Sat, 11 Dec 2021 14:06:05 -0500
X-MC-Unique: RGFpQCYRNnmBMFd4jzzYGw-1
Received: by mail-ed1-f69.google.com with SMTP id d13-20020a056402516d00b003e7e67a8f93so10882279ede.0
        for <workflows@vger.kernel.org>; Sat, 11 Dec 2021 11:06:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version;
        bh=lSd/JXczLfMK24lTXIJAZhvB5blqV1dy9LZ8oYqzc2w=;
        b=Awg4QKh1XZvPHgmH6hHjNJ2rTcccVDjVtvM19OfaGU9s/EdCquP44BiCR6inNY3yvx
         fYR3R7O1L8+lhWvV1yDn3plyeMTGm5AAgpArzbF9DoO7ZmDLht63CHrSSoJlLhwWpfMO
         0N8afrKDR2RjQs66GiZ6A5N+zGoSgRUzty7DDJ2bmKdkyI6/I4qus6rMW9ORYPYliwHU
         u3Is4x1F59SOizhcycybLqBM1X7EAWuzbtM/Ikca55EWRDFeLOjrPSGiL633OTtiXWMl
         FJKXYyOmw1Lh17Kvv42cb3R570zyUHr1tKMpLgHl7UvVUbgVPJHAH7+3ZS7LGkCa7MmQ
         HzVA==
X-Gm-Message-State: AOAM532FqvgvyCVyrvudvPW1SIB5jhl4nChXglslR7IOEjdC6r2sOz8M
        AVP8maUcdIue23n+pzKI+EUVmTvdokvn14Wo6nshEkB050BWrATAfBT8OGDrRJPH8GF7u2uEMe4
        /K9PoJauNWPgk6poL/opvNjDjEYt30IRvJVE8lMrFWzjbdVKWr0ik3d9LqM8IvGrhIvU=
X-Received: by 2002:aa7:d510:: with SMTP id y16mr48905045edq.338.1639249563253;
        Sat, 11 Dec 2021 11:06:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5uL6diaXh0E7cto9Qow98W+VHVFSc3w3nYgbjio/6whdZ3Ovn90JXsPKz+FpUX0p0j+P/kA==
X-Received: by 2002:aa7:d510:: with SMTP id y16mr48904937edq.338.1639249562253;
        Sat, 11 Dec 2021 11:06:02 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id d3sm3480610edx.79.2021.12.11.11.06.01
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:06:01 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 01B1D180471; Sat, 11 Dec 2021 20:06:00 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     workflows@vger.kernel.org
Subject: Monitoring the status of your own patches on patchwork?
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Sat, 11 Dec 2021 20:06:00 +0100
Message-ID: <87mtl7ufl3.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi everyone!

I was wondering if anyone had any nifty tricks or utilities to help
monitor the status of your own patch submissions on a patchwork
instance? Things like getting a notification when a patch changes status
or when one of the automated checks on that particular patchwork
instance fails for a patch you submitted?

I can just filter the patchwork web interface to my name, of course, but
I would like something that can be automated so I can make the stuff I
care about show up in my inbox :)

Many thanks in advance!

-Toke

