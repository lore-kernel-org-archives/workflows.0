Return-Path: <SRS0=lZea=XT=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28125C432C1
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 09:26:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC161214AF
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 09:26:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zmd7IIqI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729865AbfIXJ0K (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 24 Sep 2019 05:26:10 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29729 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729613AbfIXJ0K (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 24 Sep 2019 05:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1569317169;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4AuNR0PDrbWyM4NQ9Qwo7rkJ1/WerTicVk8+EFoKItk=;
        b=Zmd7IIqI+Jj4bM70Sca0nrsF/T4x/oLMRinXbkDzHo3j2M70YTPGBmtRDBeCcx/QRoMcj1
        8C3bhqGWgGS3RAog/QrwQMAjiYnbt+3mV600fQf1Kpl15nQYq84uv5TyVPTOaxaoBRZ6/D
        ZaRjo9I+dxFwPujqKxZxozypfEhqz7w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-OHu-4DQGOFqiigxiEU4l_g-1; Tue, 24 Sep 2019 05:26:07 -0400
Received: by mail-wr1-f71.google.com with SMTP id c1so339201wrb.12
        for <workflows@vger.kernel.org>; Tue, 24 Sep 2019 02:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ef6xoRmbLOhAorD7Of1U2O8vq97rY80eOJlS/MX8Kzw=;
        b=exHhcuRg6rx2ZaiSiq4QgbmF65wC/XWAfs6W2d25MuMWQJyeW6ICMXKI8Meb+rtr3/
         rlEE4/Yx1BWiphBldqdAEOLATLFK/lCZvmckWB+RIIx1ZDYRQnK4moiDB3dBvgXGa9xK
         gIDpwmy2f50+z7f5Xbdyz7gWQkSLe+brNKM+Zb0o1qUVqE4YQcTv7awyG5Ag9bgk/z8Q
         2ySB9oGUOiZFnhu87gBus5IpLUvtVIFnTj4ed6Pm92jERlzu47agVwGub5F7ou4+lpwn
         bwPfSbs+qMqw0bGfFNNo3RvVF94DVof7LCIa4qWIbcsGjLS0BRoX4XM4iljTWzUkrlU/
         4epA==
X-Gm-Message-State: APjAAAWCqBpUWzog0DYJzW9VPvDKGXTxyQHu6FYWxRnX+GQMKJshHsFd
        Cjxd3qY6K5g41pCmOuYa6OFkU+ungmkgJ1vXCbYY47ucFXT4mraRVifEIIZpzFbp7eNCtaCOsvd
        uzwW79dVep+Q0hWmJcprx
X-Received: by 2002:adf:f151:: with SMTP id y17mr1473925wro.244.1569317165098;
        Tue, 24 Sep 2019 02:26:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyNbvCwXpq95ph/f3xSt+hR3wX4S5bSzNb6DME8SHH7DhYp3iZFiFsXWKa4mTOTNDvu+QzR4g==
X-Received: by 2002:adf:f151:: with SMTP id y17mr1473911wro.244.1569317164787;
        Tue, 24 Sep 2019 02:26:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9520:22e6:6416:5c36? ([2001:b07:6468:f312:9520:22e6:6416:5c36])
        by smtp.gmail.com with ESMTPSA id d4sm859571wrq.22.2019.09.24.02.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2019 02:26:04 -0700 (PDT)
Subject: Re: New list for people to share maintainer workflows
To:     Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
References: <BWZVL56NCQCT.37ZPAQOP2BDSN@homura>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <044aea5a-91a9-06a5-8503-38bcf9085be1@redhat.com>
Date:   Tue, 24 Sep 2019 11:26:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BWZVL56NCQCT.37ZPAQOP2BDSN@homura>
Content-Language: en-US
X-MC-Unique: OHu-4DQGOFqiigxiEU4l_g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 14/09/19 18:45, Drew DeVault wrote:
> # Identifying different versions of the same patchset.
>=20
> Like you mentioned, no one likes Change Ids, including me. So far the
> best option I've considered is checking the date - it gets perserved
> even through rebases and is /basically/ unique. Enough rebasing and it
> *will* get lost, though, and then manual intervention is required.
>=20
> I've considered a few ways to address this. One route might be to make
> git send-email smarter, and utilize heuristics on the reflog to try and
> identify that a patch is a -v2. Then we can add an email header like
> `Superceeds: <commit or message id or something new>`.

The date however is lost across git-send-email.  However, you can match
series, rather than patches; a Superseeds header would be nice for that,
but often times it is enough to match on the subject to get a decent result=
.

It's then possible to run a minimal matching algorithm to identify a
patch that "moves" across revisions of the series.  This is how "git
range-diff" works.

By the way, let me introduce Patchew! [1] Patchew was started when
patchwork seemed to be mostly dead, so it is somewhat similar to
Patchwork 2.0. But it has some nice functionality such as "git
range-diff"-like version comparison, and especially the patch importer
pushes each submitted series to git, complete with Reviewed-by tags and
the like.  The result is then used to run test scripts.  It also has a
REST API and a simple plugin API, so it should also be quite easy to
write new plugins to automatically parse syzbot or 0day emails and turn
them into test failures.

Paolo

[1] I have mentioned Patchew before on the kernel.org users mailing
list.  The largest project using Patchew is QEMU, whose "patch list"
page on patchew.org is at https://patchew.org/QEMU/.

> Less desirable options would affect people's workflows, which is
> something I'd like to avoid. One example is adding new commands which
> explicitly track the evolution of a feature in your local git
> repository.

