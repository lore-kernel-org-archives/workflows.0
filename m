Return-Path: <SRS0=lZea=XT=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6955AC432C1
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 09:43:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F6792146E
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 09:43:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SwaOXjl7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504363AbfIXJnz (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 24 Sep 2019 05:43:55 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34896 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725884AbfIXJnz (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 24 Sep 2019 05:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1569318234;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Bmn6PMqH7mLvtNeOiyqQHlaeVsxEAA941mRwv9zu7DI=;
        b=SwaOXjl7tUP2Cuqn8nn9FI6Uxbsm9ehRov5h7n8f/Q0YNwa763vY6FeCXu9ZuaJ/lL61QT
        P3rnsQSsz6Gdv4XYaBSiI2Z914EQEA5WlxGEbgq2saalLeU1W2f1kcLaVB6va97xHuPuT1
        MFe1BepdcYIIJ3mZiLs4BZtVxLal38Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145--Hf0QdrnOBypvyZCM7ySDA-1; Tue, 24 Sep 2019 05:43:53 -0400
Received: by mail-wr1-f69.google.com with SMTP id j2so364644wre.1
        for <workflows@vger.kernel.org>; Tue, 24 Sep 2019 02:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u7HyzSL8pi0/W+/lQf6vFpZR/WuhQevYoYFOFPXWaGI=;
        b=RFL8F2YtR0Nzcp+wqF/3CIm1HimOu0XtVRCDOKxy/D+uzA+D8zioF/1cpUgAWdcAZm
         elmyLBGC3RiSsAVt0oyf8EXn0zXEuAgRgRNtLsLH+BGqZphHepdVvwiEnyAUlkX9BA6s
         yyZG5fn5cT0miXcdU1z91aNUh986mh8zei6mcXaY9WvkFALJ57rY3q6eODSPM0oLUjLt
         2gwsmOmQgTtTuUBGxg7ohWG1oHTQuSvH/ySEuHcZ7X4W0jEX/ivRoepzkLPpnT2x03nZ
         1MxfR5LUgg3eneDvTRh/HrmsG1gmpAJuj3mVbXT4irxnonKUkQrHt0hXa1W5JTJMJbH4
         dvKQ==
X-Gm-Message-State: APjAAAUoQ+J3gEkH1ZNQ4kZldw6ETJUP5c67SanViXFleEJ5Uj92/0E4
        0Z6ztPGzHzOCS9va3xk6lDjur36tVjD5XBG7hCabVY5nXs+gxqLY1XYk5ifFSs/WgmKtel7e9Nt
        lF6ArVdyb5JVJfKQDV4sn
X-Received: by 2002:adf:ec44:: with SMTP id w4mr1480964wrn.251.1569318232070;
        Tue, 24 Sep 2019 02:43:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlcKdWseOMlDKt2m+Fq0d1S2UQYanaKSXLHhn5NbDfWT/4TnY1ifUs6F7VkzbieDzy3BgceQ==
X-Received: by 2002:adf:ec44:: with SMTP id w4mr1480946wrn.251.1569318231816;
        Tue, 24 Sep 2019 02:43:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9520:22e6:6416:5c36? ([2001:b07:6468:f312:9520:22e6:6416:5c36])
        by smtp.gmail.com with ESMTPSA id r28sm2882882wrr.94.2019.09.24.02.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2019 02:43:51 -0700 (PDT)
Subject: Re: Kernel development collaboration platform wish list
To:     Stefan Schmidt <stefan@datenfreihafen.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <1811089.yxvLMk49Ug@kreacher>
 <2664c41b-e97c-4667-fb90-2eb37affea14@datenfreihafen.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8d1c457e-1661-5a5c-69d7-c17d4633b978@redhat.com>
Date:   Tue, 24 Sep 2019 11:43:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2664c41b-e97c-4667-fb90-2eb37affea14@datenfreihafen.org>
Content-Language: en-US
X-MC-Unique: -Hf0QdrnOBypvyZCM7ySDA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 17/09/19 20:40, Stefan Schmidt wrote:
> (c) Git tag sanity checking
>     Some maintainers have scripts for these, but not all. I still see
> quite some mails about this coming from linux-next checking.
>     1) ensure SOB by the actual author
>     2) verify correct SOB/ACK/Reviewed tag usage (funny to see how often
> things are manually added and gotten slightly wrong)
>     3) verify Fixes: tag usage (min shasum length, one line without
> break, etc)
>=20
> There are likely more.
>=20
> Where and how this is to be done I would leave open as this is only
> requirements collection right now. I just feel that this kind of sanity
> checking could be easily automated, hopefully without getting into the
> way of maintainers.

This can be done by a "checkpatch"-like test.  If a full-blown
checkpatch is undesirable (not sure why it would be, though), a special
mode that only checks headers can be added to the script.

Paolo

