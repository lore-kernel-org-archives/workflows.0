Return-Path: <SRS0=xtfX=XU=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9E9C432C1
	for <workflows@archiver.kernel.org>; Wed, 25 Sep 2019 06:35:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C80F221D7E
	for <workflows@archiver.kernel.org>; Wed, 25 Sep 2019 06:35:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hRZ3ubDn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392948AbfIYGfU (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 25 Sep 2019 02:35:20 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58151 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2392834AbfIYGfT (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 25 Sep 2019 02:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1569393318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e+VkFgnyDVkXA9Qcy4MjP28uPElqJAluLjDL9CAN5+8=;
        b=hRZ3ubDnZMi138D2LeHfGGk3uH1jCERU9THpmr7WAstFijlpjw11DbRIKVKTnPUmu9XBsX
        aRkHxoq7xL6+iFlCpMHU7+lW+w77cQ+oHkKvcnLDLDmAkBtOk+NpITNA4Ysm60IbM+QRb6
        0e1KnczCr0DWPqF2Xq8Ho0C904WymiA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-Ol3ufolRP2iDa0_GKwaUkw-1; Wed, 25 Sep 2019 02:35:16 -0400
Received: by mail-wr1-f69.google.com with SMTP id n18so1784359wro.11
        for <workflows@vger.kernel.org>; Tue, 24 Sep 2019 23:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=c+myMqA9576STDKMh0qsoz9AlBog9tlvexdprx3MgKE=;
        b=MtXk5iYwibYmErKC28D3lEBOXu5LRqkgB6zC1MuGRlWdXL5z47z/j9W65jShwrqohJ
         zzStWwhWJi+xIeQlaWkvZsFls53aYYfhE3t/kJ9uq5NWX1+YKECDI6EM5JJupxQgaP1E
         Zmik/LStifFU4IJxQmJlUZ6MWUq3f3VRcxWnFCPMyNXUktepOisbXdrzl65gy2EaNQrk
         Q7dn0cvNvMpNx6xIl9ytyJU4r8k9+nvnXN4HSSfqT3gkuq2wvzWgr7cj9f77mSEMlFPi
         X37hc8lixroKnnhj6p1DGWErIXmdoJFdf/Xzv8nUL8poeYMgaGNx+2mQWiWtvG4v7tV5
         gs3A==
X-Gm-Message-State: APjAAAUyrQrcjRxD+KozpmnclKq4kThnR2bAm1fJn82AAPgVh/OBrj3B
        Wzmia/VBfcPHcI6k1ShrljhemhkzENEr0GqCK3aDyc6awyXX6VcxKWSrlM3UbDAKjoecsl2fVq3
        V+Xyn64GKBkuofMElsXCN
X-Received: by 2002:a5d:51d2:: with SMTP id n18mr7212828wrv.10.1569393315005;
        Tue, 24 Sep 2019 23:35:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwRB/Pwu2+pGBo2xcmdj+ilZhh4/x3jMAyYHF9XaBQ1jdmRuxMT0kiH37ac4Ax1Btw/FmbGyA==
X-Received: by 2002:a5d:51d2:: with SMTP id n18mr7212796wrv.10.1569393314797;
        Tue, 24 Sep 2019 23:35:14 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (borgediget.toke.dk. [85.204.121.218])
        by smtp.gmail.com with ESMTPSA id 30sm812704edr.78.2019.09.24.23.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 23:35:14 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 83BDF18063D; Wed, 25 Sep 2019 08:35:13 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     David Rientjes <rientjes@google.com>,
        Neil Horman <nhorman@tuxdriver.com>
Cc:     workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
In-Reply-To: <alpine.DEB.2.21.1909241609540.78294@chino.kir.corp.google.com>
References: <20190924182536.GC6041@hmswarspite.think-freely.org> <alpine.DEB.2.21.1909241609540.78294@chino.kir.corp.google.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 25 Sep 2019 08:35:13 +0200
Message-ID: <877e5w51em.fsf@toke.dk>
MIME-Version: 1.0
X-MC-Unique: Ol3ufolRP2iDa0_GKwaUkw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

David Rientjes <rientjes@google.com> writes:

> I'd be very interested to know how others maintain patch series across
> multiple base kernel version especially when they need to maintain the
> feature for those kernel versions separately, how RH handles their
> patches before they are ready to be officially posted, etc.

The short answer is "we don't". Features are developed upstream and not
shipped in RHEL until they've landed upstream. The internal branches
contains plenty of backports and bug fixes, but the flow of patches is
one way: from upstream to internal.

There's a long-ish blog post here describing this in the context of
openstack, but really speaking quite generally:

https://community.redhat.com/blog/2015/03/upstream-first-turning-openstack-=
into-an-nfv-platform/

-Toke

