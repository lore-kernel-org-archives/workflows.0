Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D5CC10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 04:39:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 132FE2089C
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 04:39:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TwEF4Em5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbfJOEjy (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 00:39:54 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:40780 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbfJOEjy (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 00:39:54 -0400
Received: by mail-qk1-f194.google.com with SMTP id y144so17981461qkb.7
        for <workflows@vger.kernel.org>; Mon, 14 Oct 2019 21:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1maCgj4rLPKtPqWY+v5nJ4Hl7GtRZv4L7Za3RGEP1kM=;
        b=TwEF4Em5+3gX8HNydpFQypJgANSf9t71Fp1w8e+Bdpda+ncbJgo3P85wCLOXKCbcc0
         agzamR2fK1DPiPpo356CKwqc275g1g8n/luDRda1Qyt22TvCJwPvlDA9FWZkhi5ZAGs8
         ZAI4SeiM8Lj956+8SrwLT4qCPf30b7vysCcWSbiJfdkjYfYVYVTfh6wvg/LSfWyJquQS
         K7BomMNusH5dIveM7F0h/DAmvG8POSBex+oEXW7N6869WpUnpxrsAv5uDP18liP4dOct
         UkPSMXim0vAU8qarj7zSDQoKPqXVJm89LRq8lAb3y3edLkEGvxT37IEs6Y3bJZ7pzEUh
         c1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1maCgj4rLPKtPqWY+v5nJ4Hl7GtRZv4L7Za3RGEP1kM=;
        b=iI+w5/2zsN5UQGy6NsoGZc7P3sDbCiTCCO9jDI6ucspE9wjgpss/g3CG/XE5Pl6zDc
         Hiu4TZhHJ0odWkEiBDTFXjpUb79+UKEUgKXDyHTUUvtiH+kZTnCEhKEPAnwJgDi9cG3C
         kTEBvDSVU9fxBOsS8P+20LCvnsC/mcJ1b1cAlRhKVXSRuNpN/Fm9Ti1B42CBOI89GIgn
         7R/dp+a90QjyLGJsGSa/yUPQ1RGB1YDkmpfVDdftd0LgIt/4f5HXA4nlLwInoYkRE2WQ
         Db6iPNMewdmUBwGUfOxgtneqmChxpPqMvRKjMq0CzUeMAqnnFSs0Q9E81hdXTDKfypQs
         Dxzg==
X-Gm-Message-State: APjAAAWrX5ZT+4i9xYfw4Zf5iFeUW3WlJSppjrZAIzh81CMzcfGnZGaW
        XVtdjTWNDQsTqRXwmhMZIXC8MogDTLqZr1klvFPm2w==
X-Google-Smtp-Source: APXvYqxQhAQ1TkNCjenMZYZ33QQRs/14nU7vyBJDVzNCA57UyUpif1lBiKZGLp56awBxLCC90G0X4uJrcZHVkPutON8=
X-Received: by 2002:a37:9202:: with SMTP id u2mr33749069qkd.8.1571114392641;
 Mon, 14 Oct 2019 21:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com> <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com> <20191014205658.GG5564@mit.edu>
In-Reply-To: <20191014205658.GG5564@mit.edu>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 15 Oct 2019 06:39:40 +0200
Message-ID: <CACT4Y+ZkteF1cGX2RjL99yagVLXxLSFcSoLBMtGitDVNY-0LJQ@mail.gmail.com>
Subject: Re: RFE: use patchwork to submit a patch
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 14, 2019 at 10:57 PM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>
> On Mon, Oct 14, 2019 at 04:58:17PM +0200, Dmitry Vyukov wrote:
> > As one data point, I cannot send emails with git send-email anymore.
> > It used to work, then broke and I don't know how to fix it. Now it says:
> >
> > 5.7.8 Username and Password not accepted. Learn more at
> > 5.7.8  https://support.google.com/mail/?p=BadCredentials
> > s10sm8376885wrr.5 - gsmtp
> >
> > I suspect it has something to do with two factor auth.
> > So that's it: it cannot contribute to kernel right now.
> > I will not consider time spent fixing it as useful time investment.
>
> Note that this is a Googler-specific problem, as it's due to
> corp-security requirements that other GMail users and most GSuites
> customers won't have.  (For example, you could use another SMTP server
> and bypass the corp. mail submission server, but for google.com e-mail
> addresses, the DMARC settings foreclose that particular workaround.)
>
> So it's an extreme case, and is an example of corp e-mail insanity.
> The good news is that for companies that are really serious about
> working with upstream, they will roll out solutions for their own
> customers.  For example, with IBM, since Lotus notes was maximally
> unfriendly to OSS development practices, they created a separate mail
> system with ldap@linux.ibm.com addresses be cause it was simply
> impossible to engage with upstream development using ibm.com
> addresses.  So there are work arounds, and I encourage you to reach
> out to other Google kernel developers --- and if you are unhappy,
> please file internal bugs against the corp infrastructure.
>
> Personally, my solution to this problem is to use a non-google address
> (tytso@mit.edu) for upstream work, because life is too short to fight
> with GMail.  (Although it is doable; as many people can attest.)
>
> > I would say that we need to aim at  a process that does not require a
> > friendly experienced person to answer any of your questions in the
> > common case. Lots of people will simply not ask any questions.
>
> If you work inside a corporation with "unique" e-mail settings, you
> may need to ask a friendly experienced person inside your company, or
> look for the "new employee" (Noogler) web documentation for working
> with the kernel.

I used my private gmail account to send emails. My private email
account stopped working.
