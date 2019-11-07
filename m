Return-Path: <SRS0=i0oo=Y7=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5760C43331
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 20:53:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E2442166E
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 20:53:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T3wbqx+7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfKGUxP (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 15:53:15 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41705 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725893AbfKGUxP (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 7 Nov 2019 15:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573159993;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rdVUCuQ52Qg9xn/Zq5OqsLkxFX/hVM8GArE85bqKhkI=;
        b=T3wbqx+7IRQbnE/UE0da8ZXDKXEh25MvYBxMjC06GZnq6XZQYoI3/X8yX3+bWKPX50s/JX
        +rviBBJs6SL5uoGuiLhnxLxvsPPC1v2wyfgkF98w8pGDFsrieZRlqZhkU66EUtaoT7VFfr
        ppsPEHvc15EgO6acAV3zeVoxA2Z/nkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-qqEjGU6FPkqiCZXzflqn8Q-1; Thu, 07 Nov 2019 15:53:08 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2916E477;
        Thu,  7 Nov 2019 20:53:07 +0000 (UTC)
Received: from redhat.com (ovpn-123-187.rdu2.redhat.com [10.10.123.187])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ECAA608B2;
        Thu,  7 Nov 2019 20:53:06 +0000 (UTC)
Date:   Thu, 7 Nov 2019 15:53:04 -0500
From:   Don Zickus <dzickus@redhat.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     workflows@vger.kernel.org, automated-testing@yoctoproject.org,
        Han-Wen Nienhuys <hanwen@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [Automated-testing] Structured feeds
Message-ID: <20191107205304.3myfwfhaviizgr73@redhat.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: qqEjGU6FPkqiCZXzflqn8Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Nov 05, 2019 at 11:02:21AM +0100, Dmitry Vyukov wrote:
> Hi,
>=20
> This is another follow up after Lyon meetings. The main discussion was
> mainly around email process (attestation, archival, etc):
> https://lore.kernel.org/workflows/20191030032141.6f06c00e@lwn.net/T/#t
>=20
> I think providing info in a structured form is the key for allowing
> building more tooling and automation at a reasonable price. So I
> discussed with CI/Gerrit people and Konstantin how the structured
> information can fit into the current "feeds model" and what would be
> the next steps for bringing it to life.
>=20
> Here is the outline of the idea.
> The current public inbox format is a git repo with refs/heads/master
> that contains a single file "m" in RFC822 format. We add
> refs/heads/json with a single file "j" that contains structured data
> in JSON format. 2 separate branches b/c some clients may want to fetch
> just one of them.
>=20
> Current clients will only create plain text "m" entry. However, newer
> clients can also create a parallel "j" entry with the same info in
> structured form. "m" and "j" are cross-referenced using the
> Message-ID. It's OK to have only "m", or both, but not only "j" (any
> client needs to generate at least some text representation for every
> message).

Interesting idea.

One of the nuisances of email is the client tools have quirks.  In Red Hat,
we have used patchworkV1 for quite a long time.  These email client 'quirks=
'
broke a lot of expectations in the database leading us to fix the tool and
manually clean up the data.

In the case of translating to a 'j' file.  What happens if the data is
incorrectly translated due to client 'quirks'?  Is it expected the 'j' data
is manually reviewed before committing (probably not).  Or is it left alone
as-is? Or a follow-on 'j' change is committed?

A similar problem could probably be expanded to CI systems contributing the=
ir
data in some result file 'r'.

Cheers,
Don

>=20
> Currently we have public inbox feeds only for mailing lists. The idea
> is that more entities will have own "private" feeds. For example, each
> CI system, static analysis system, or third-party code review system
> has its own feed. Eventually people have own feeds too. The feeds can
> be relatively easily converted to local inbox, important into GMail,
> etc (potentially with some filtering).
>=20
> Besides private feeds there are also aggregated feeds to not require
> everybody to fetch thousands of repositories. kernel.org will provide
> one, but it can be mirrored (or build independently) anywhere else. If
> I create https://github.com/dvyukov/kfeed.git for my feed and Linus
> creates git://git.kernel.org/pub/scm/linux/kernel/git/dvyukov/kfeed.git,
> then the aggregated feed will map these to the following branches:
> refs/heads/github.com/dvyukov/kfeed/master
> refs/heads/github.com/dvyukov/kfeed/json
> refs/heads/git.kernel.org/pub/scm/linux/kernel/git/torvalds/kfeed/master
> refs/heads/git.kernel.org/pub/scm/linux/kernel/git/torvalds/kfeed/json
> Standardized naming of sub-feeds allows a single repo to host multiple
> feeds. For example, github/gitlab/gerrit bridge could host multiple
> individual feeds for their users.
> So far there is no proposal for feed auto-discovery. One needs to
> notify kernel.org for inclusion of their feed into the main aggregated
> feed.
>=20
> Konstantin offered that kernel.org can send emails for some feeds.
> That is, normally one sends out an email and then commits it to the
> feed. Instead some systems can just commit the message to feed and
> then kernel.org will pull the feed and send emails on user's behalf.
> This allows clients to not deal with email at all (including mail
> client setup). Which is nice.
>=20
> Eventually git-lfs (https://git-lfs.github.com) may be used to embed
> blob's right into feeds. This would allow users to fetch only the
> blobs they are interested in. But this does not need to happen from
> day one.
>=20
> As soon as we have a bridge from plain-text emails into the structured
> form, we can start building everything else in the structured world.
> Such bridge needs to parse new incoming emails, try to make sense out
> of them (new patch, new patch version, comment, etc) and then push the
> information in structured form. Then e.g. CIs can fetch info about
> patches under review, test and post strctured results. Bridging in the
> opposite direction happens semi-automatically as CI also pushes text
> representation of results and that just needs to be sent as email.
> Alternatively, we could have a separate explicit converted of
> structured message into plain text, which would allow to remove some
> duplication and present results in more consistent form.
>=20
> Similarly, it should be much simpler for Patchwork/Gerrit to present
> current patches under review. Local mode should work almost seamlessly
> -- you fetch the aggregated feed and then run local instance on top of
> it.
>=20
> No work has been done on the actual form/schema of the structured
> feeds. That's something we need to figure out working on a prototype.
> However, good references would be git-appraise schema:
> https://github.com/google/git-appraise/tree/master/schema
> and gerrit schema (not sure what's a good link). Does anybody know
> where the gitlab schema is? Or other similar schemes?
>=20
> Thoughts and comments are welcome.
> Thanks
> --=20
> _______________________________________________
> automated-testing mailing list
> automated-testing@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/automated-testing

