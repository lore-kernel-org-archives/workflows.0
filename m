Return-Path: <SRS0=ZkQc=ZD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F87C17441
	for <workflows@archiver.kernel.org>; Mon, 11 Nov 2019 15:14:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A321206A3
	for <workflows@archiver.kernel.org>; Mon, 11 Nov 2019 15:14:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iIzcSS0b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfKKPOr (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 11 Nov 2019 10:14:47 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50066 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726811AbfKKPOq (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 11 Nov 2019 10:14:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573485286;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2TvGzvXdtELb36honQsv4enigX7jalIpQTIgCVxtcs0=;
        b=iIzcSS0bckiAEubsIbyV9yPliIjQAxfaM7uac+mGzSV0NwKm+QcHZam2mZe6+C+oSVDqTb
        yg/ud/9CNTXD73Yc/Ky2Jv369czyQ7llqZzvzrytcSYcgTxL+NjDEOhAo+UE9PTFIcsQfz
        Pe0lRC9BZ+l+8479n0It7uYZbxGXm44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-n6kzGNGyN2K8aMNAA9pG_Q-1; Mon, 11 Nov 2019 10:14:42 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9B44DB60;
        Mon, 11 Nov 2019 15:14:41 +0000 (UTC)
Received: from redhat.com (ovpn-124-101.rdu2.redhat.com [10.10.124.101])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id DA808608E6;
        Mon, 11 Nov 2019 15:14:40 +0000 (UTC)
Date:   Mon, 11 Nov 2019 10:14:38 -0500
From:   Don Zickus <dzickus@redhat.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     workflows@vger.kernel.org, automated-testing@yoctoproject.org,
        Han-Wen Nienhuys <hanwen@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [Automated-testing] Structured feeds
Message-ID: <20191111151438.ei3wo4vfnabc25tx@redhat.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <20191107205304.3myfwfhaviizgr73@redhat.com>
 <CACT4Y+bpm+fqU_rLRnrTBt22Mu_6c4kRbHwvXbZXv+Q-37ZLaw@mail.gmail.com>
 <20191108145257.yb4fjfjc5yag6jqp@redhat.com>
 <CACT4Y+bxPxQ64HEO2uGRkbk9vJSeg64y10Lak4c2K54J7GyFFA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACT4Y+bxPxQ64HEO2uGRkbk9vJSeg64y10Lak4c2K54J7GyFFA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: n6kzGNGyN2K8aMNAA9pG_Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Nov 11, 2019 at 10:20:22AM +0100, Dmitry Vyukov wrote:
> > Ok.  Yeah, in my head I was thinking the data is largely right, just
> > occasionally 1 or 2 fields was misrepresented due to bad client tool or
> > human error in the text.
> >
> > In Red Hat was use internal metadata for checking our patches through o=
ur
> > process (namely Bugzilla id).  It isn't unusual for someone to accident=
ally
> > fat-finger the bugzilla id when posting their patch.
> >
> > I was thinking if there is a follow-on 'type' that appends corrections =
as you
> > stated, say 'type: correction' that 'corrects the original data.  This =
would
> > have to be linked through message-id or some unique identifier.
> >
> > Then I assume any tool that parses the feed 'j' would correlate all the=
 data
> > based around some unique ids such that picking up corrections would jus=
t be
> > a natural extension?
>=20
> Yes, this should be handled naturally in this model. Since it's not
> possible to mutate any previously published info, everything is
> represented as additions/corrections: adding a comment to a patch,
> adding Reviewed-by, adding Nack, adding test results. The final state
> of a patch is always reconstructed by "replaying" all messages
> published regarding the patch. So naturally if we mis-parsed a message
> as "Acked-by: X" and then corrected that to "Nacked-by: X" and
> republished, whoever will replay the feed, should replace Acked-by
> with Nacked-by.

Great.  That makes sense to me.  Thanks!

Cheers,
Don

