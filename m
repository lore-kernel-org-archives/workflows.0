Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC03EC5DF60
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 07:58:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD48121D6C
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 07:58:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GQrSRSko"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbfKHH66 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 02:58:58 -0500
Received: from mail-qt1-f172.google.com ([209.85.160.172]:44950 "EHLO
        mail-qt1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbfKHH66 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 02:58:58 -0500
Received: by mail-qt1-f172.google.com with SMTP id o11so5449266qtr.11
        for <workflows@vger.kernel.org>; Thu, 07 Nov 2019 23:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iG7SbamgVaKEZuBc0waa1oClroVyn+/yKo7JLTNQ0vM=;
        b=GQrSRSkoAx4+ZVbod8TDbQQzaxzDnLfwm1iekAgsiPU137k6509cM8oYD4skKAbAcj
         aXGEgT/bUvyWTka1MTOuMSoyQiwircYWxO7579hfwxhRMftKZsYHrzNrbif0bO4QHWdw
         OrYjpMVDJ6xBRRoBNbAaOCGTTiamVuy8cQkSWceXYF6jNEoFm8nTUIsAVOiQ1OK0TM5t
         v1HFnMSwryPGABbrR+3NQ0uQqNqs4LZiUuOCdWWlZh+wKs9u4KslfzMMtxtQuSAric5o
         0j0khXEPuDeL+jrxgkGfny6VuTfYk9A8UQ+7K1ZA1xaYVB8PHHhLoNTZr+ekQlayM+fa
         Kklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iG7SbamgVaKEZuBc0waa1oClroVyn+/yKo7JLTNQ0vM=;
        b=tUgA/cUUhziPIA8r9xX/MbfipZvDGjimu/vbVs6s0VehrO9FvGmBCHvWsNchHfvf7m
         XbbYyphOkG3fS8S7OajGXonJecgTwBRjVngYwfejc+3ue/A24YcbmK+QK1KXyDQicTsk
         MWt/Z1iwS4SAQpU3L3lS9KUmhclauUrntu9+CQV3Xo3xSPGFSnQrDZXW5xC1p1FKYXQF
         iVfQ7uXQQs7KNV/akWqHp1zUcgAXHBZRzrHkpdkO5gGrmTDS/Wz28qDnHDeQZuqR06Um
         x5ALbYEwp4cZzijahzaO2iP0lH/OlCLZShUIXHC4CbSetW/zsuzY8ONiwI6/pwQU7/as
         pEBA==
X-Gm-Message-State: APjAAAVXKRW+X2VuuJCJe9q0v0aLscY4RWvyvfs5iSfmoTNXHojc8RmQ
        n1Us85IXJCvt3ZA6BZUD6bqECJhhROiZm/VfTspJ/Q==
X-Google-Smtp-Source: APXvYqxBUAvEq0LXq67IaAK2C/xa2//dAHLwS8O/Ky9qwBS7awhKwJWOw17ePgK/siwrjqpy/PehPgvTiIw148UBq+w=
X-Received: by 2002:aed:24af:: with SMTP id t44mr1081425qtc.57.1573199936915;
 Thu, 07 Nov 2019 23:58:56 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <8736f1hvbn.fsf@dja-thinkpad.axtens.net> <20191107204356.kg3ddamtx74b6q4p@redhat.com>
In-Reply-To: <20191107204356.kg3ddamtx74b6q4p@redhat.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 8 Nov 2019 08:58:44 +0100
Message-ID: <CACT4Y+YTe7kpEvchsHU99fH1y-STYR_tteuHTYKGUOjf6oH9kQ@mail.gmail.com>
Subject: Re: [Automated-testing] Structured feeds
To:     Don Zickus <dzickus@redhat.com>
Cc:     Daniel Axtens <dja@axtens.net>, workflows@vger.kernel.org,
        automated-testing@yoctoproject.org,
        Han-Wen Nienhuys <hanwen@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Nov 7, 2019 at 9:44 PM Don Zickus <dzickus@redhat.com> wrote:
>
> On Thu, Nov 07, 2019 at 02:35:08AM +1100, Daniel Axtens wrote:
> > > As soon as we have a bridge from plain-text emails into the structured
> > > form, we can start building everything else in the structured world.
> > > Such bridge needs to parse new incoming emails, try to make sense out
> > > of them (new patch, new patch version, comment, etc) and then push the
> > > information in structured form. Then e.g. CIs can fetch info about
> >
> > This is an non-trivial problem, fwiw. Patchwork's email parser clocks in
> > at almost thirteen hundred lines, and that's with the benefit of the
> > Python standard library. It also regularly gets patched to handle
> > changes to email systems (e.g. DMARC), changes to git (git request-pull
> > format changed subtly in 2.14.3), the bizzare ways people send email,
> > and so on.
>
> Does it ever make sense to just use git to do the translation to structured
> json?  Git has similar logic and can easily handle its own changes.  Tools
> like git-mailinfo and git-mailsplit probably do a good chunk of the
> work today.
>
> It wouldn't pull together series info.

Hi Don,

Could you elaborate? What exactly do you mean? I don't understand the
overall proposal.
