Return-Path: <SRS0=XKJj=4C=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC5EC35242
	for <workflows@archiver.kernel.org>; Fri, 14 Feb 2020 19:40:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68BEE206CC
	for <workflows@archiver.kernel.org>; Fri, 14 Feb 2020 19:40:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WqwYyGDW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388656AbgBNTk5 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 14 Feb 2020 14:40:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59465 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388256AbgBNTk5 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 14 Feb 2020 14:40:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581709255;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hpYBsvVCkJl6uEsl1gO+DyOnKPi1lNSXajz2f8LpSpc=;
        b=WqwYyGDWDBvyfSLmU++IyRD8WARg/+GZtzjTyLquHNB1ZgRkR/Vqj7VwAZc0FgQ8msWdOS
        TzhXifGZnKMO71PUaZbI2yd0eG3cKFmaeXernOQ83iMBe7ILtd6Y3O1HlhOgQ29GsfYueo
        EtbwxmxyZIIjIZJhUTVilxw6ZT1Isi8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-Yf9FSh_6PUGJf5pcIo_0tQ-1; Fri, 14 Feb 2020 14:40:47 -0500
X-MC-Unique: Yf9FSh_6PUGJf5pcIo_0tQ-1
Received: by mail-lj1-f198.google.com with SMTP id h26so3737653ljj.0
        for <workflows@vger.kernel.org>; Fri, 14 Feb 2020 11:40:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=hpYBsvVCkJl6uEsl1gO+DyOnKPi1lNSXajz2f8LpSpc=;
        b=gMVysbO2w39D+R5GQfIpHjPO8WWB5hK+a5KRaWiNDoByEq01m8YevUVo7qrCZJKeW/
         UsMU8GySymMG+t7Qa+e38IAv4E9gb/b+g2ELVBXZDTp/cC5Wx0W/eMyT+gNIkLPySiFj
         rAl/gy/MUhoVNM/DkxUf42V+c93nbEuUvvAVbHxpmTr19Uw005k1cbDoyIy62BYzBrM8
         Srd0BIOgllp+A3WdcC1X/Io7P/mMgsToyl2LS2f1Uh7KQvgNv8kfHH1SokUfOf2ehx+m
         Xr8fZhIQeVead4aGiUPKKbe+qVOurqtM3uBwglSAacK9MGjZriSK843e1wz8C7kLB7bt
         3cjg==
X-Gm-Message-State: APjAAAX4lvw2A7xWpe6UhSt+HbnXtYyZNl4hrPRvYcZpjt09Gi5Wdq4g
        swZxM3DMMS0HzoJCp6NqpYu+P367YCbnWvOl8hWwcVDyOjI2uissI5fLwT9VaXnCiYOKaSColG+
        9nZNCnVy8NBsnywNLXOi+
X-Received: by 2002:a19:becc:: with SMTP id o195mr2413784lff.17.1581709245677;
        Fri, 14 Feb 2020 11:40:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqyz0e87Ki8bRTAQQ+cTelVVQYie5aVTfElEhzORF/nCS2l/9lsCGb/uwc2XbIrovlg077q/xQ==
X-Received: by 2002:a19:becc:: with SMTP id o195mr2413778lff.17.1581709245472;
        Fri, 14 Feb 2020 11:40:45 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id d24sm3322870lfl.58.2020.02.14.11.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 11:40:44 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id BE8A4180371; Fri, 14 Feb 2020 20:40:43 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Kevin Hilman <khilman@baylibre.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Subject: Re: get-lore-mbox: quickly grab full threads from lore
In-Reply-To: <7hwo8p9db1.fsf@baylibre.com>
References: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local> <7hwo8p9db1.fsf@baylibre.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 14 Feb 2020 20:40:43 +0100
Message-ID: <87zhdlares.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Kevin Hilman <khilman@baylibre.com> writes:

> Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:
>
>> I'd like your opinion on this quick helper script I wrote that uses any 
>> message-id to grab a full thread from lore.kernel.org and save it as a 
>> mbox file.
>
> This is very useful, thank you!
>
> One question/request: Is there a way for it to only grab a subset of a
> series?  e.g. Some series contain patches that might end up going
> through a couple different trees (e.g. DT patches typically take a
> separate path than drivers) so as a maintainer for one of the
> subsystems, I might want to only get a subset of the series into an
> mbox, not the whole thing.
>
> IOW, Right now even if I pass a msgid from the middle of the series, it
> finds the whole series (which is cool!), but what if I want to apply
> just that single patch?  Or even better, I might want to only apply
> patches 3-5 and 9 from a 10-patch series.
>
> Is this something do-able?

git am --interactive ?

-Toke

