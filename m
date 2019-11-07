Return-Path: <SRS0=i0oo=Y7=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F387AC43331
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 20:44:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C405C206A3
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 20:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bnrBlbz6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfKGUoG (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 15:44:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21194 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725906AbfKGUoG (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 7 Nov 2019 15:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573159445;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ikj2AsvOSTFIRwL9VZQK7hCSDZvXJm5gqh0DU8Ghs6M=;
        b=bnrBlbz6tczqvyYqyBBpIRXOm2RlMY0A+S3GSUeKFTTzsfs9FpbkryNoaGE4Te8FMB3es6
        MjBfVd70bpFnGqAPy5u98mXLJ5O9JXkruj01Kgal12m2Rva437gl1Gumpm5XQSBsjznVKc
        nk/s7MjzKTLqkt2G+cYnIaMRUiQ5mgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-Sln7zxF0MAizAigVvb6Cfw-1; Thu, 07 Nov 2019 15:44:01 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0881800C61;
        Thu,  7 Nov 2019 20:43:59 +0000 (UTC)
Received: from redhat.com (ovpn-123-187.rdu2.redhat.com [10.10.123.187])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 006811001B07;
        Thu,  7 Nov 2019 20:43:58 +0000 (UTC)
Date:   Thu, 7 Nov 2019 15:43:56 -0500
From:   Don Zickus <dzickus@redhat.com>
To:     Daniel Axtens <dja@axtens.net>
Cc:     Dmitry Vyukov <dvyukov@google.com>, workflows@vger.kernel.org,
        automated-testing@yoctoproject.org,
        Han-Wen Nienhuys <hanwen@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [Automated-testing] Structured feeds
Message-ID: <20191107204356.kg3ddamtx74b6q4p@redhat.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <8736f1hvbn.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
In-Reply-To: <8736f1hvbn.fsf@dja-thinkpad.axtens.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Sln7zxF0MAizAigVvb6Cfw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Nov 07, 2019 at 02:35:08AM +1100, Daniel Axtens wrote:
> > As soon as we have a bridge from plain-text emails into the structured
> > form, we can start building everything else in the structured world.
> > Such bridge needs to parse new incoming emails, try to make sense out
> > of them (new patch, new patch version, comment, etc) and then push the
> > information in structured form. Then e.g. CIs can fetch info about
>=20
> This is an non-trivial problem, fwiw. Patchwork's email parser clocks in
> at almost thirteen hundred lines, and that's with the benefit of the
> Python standard library. It also regularly gets patched to handle
> changes to email systems (e.g. DMARC), changes to git (git request-pull
> format changed subtly in 2.14.3), the bizzare ways people send email,
> and so on.

Does it ever make sense to just use git to do the translation to structured
json?  Git has similar logic and can easily handle its own changes.  Tools
like git-mailinfo and git-mailsplit probably do a good chunk of the
work today.

It wouldn't pull together series info.

Just a thought.

Cheers,
Don



>=20
> Patchwork does expose much of this as an API, for example for patches:
> https://patchwork.ozlabs.org/api/patches/?order=3D-id so if you want to
> build on that feel free. We can possibly add data to the API if that
> would be helpful. (Patches are always welcome too, if you don't want to
> wait an indeterminate amount of time.)
>=20
> Regards,
> Daniel
>=20
>=20
> --=20
> _______________________________________________
> automated-testing mailing list
> automated-testing@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/automated-testing

