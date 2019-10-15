Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7672FC10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 15:21:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A05821835
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 15:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571152893;
	bh=80VDJlvi2rm3moGzz+obZeY/GRx9r0v6t0szjyjE3yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=c1PNuEWF3yq5j33HYK0ywq7tW7wTEDm0KQlnXfGRbfG0U8mSo5Y+/iYoLqGNf/u7I
	 IsgWrLSaLIi0pLLm25qd5AcqJtjx9uLL+XkOkmsYuBW80Mw2911EELJltftJy4utlc
	 ymqB/1JCQNKwMoIlYVGDlTUHaORw/RmEkFs2U2EM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733173AbfJOPVc (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 11:21:32 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:42506 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732991AbfJOPVc (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 11:21:32 -0400
Received: by mail-qt1-f194.google.com with SMTP id w14so31073509qto.9
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2019 08:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mV/l3TSGkG5ByXJv0UeIBB6oyrp7TSJxLJZYdsLPhn0=;
        b=LP9VOG7oTOvQfxyxGX/j9+MvOJNnaYeCjfIO3kmDieQiB8AJiGigcKFDQnajy3/hAM
         xS3HXIYwvLrVHOcw6vG8n6cUo6Uurn3YLtnXHg1Qoi4WERWKV1Tr/9ZVbYEe7JOJvqZK
         gWwlP6LGRTl4c2i3eDLJGGA0PLksqfBESAS1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=mV/l3TSGkG5ByXJv0UeIBB6oyrp7TSJxLJZYdsLPhn0=;
        b=W+AYbuwveFLA4mwmDOKEb+AYqO4MBCzaSn4vTbtLZSNZ514zZg2rpOt2qvTpWYaO5P
         RTbSS1U4wJjXKXh5l1Rx4vGGkBNZUpd1GllRqSrsFBLM0Bl/7+WE7Si/pNMylPNKWCcz
         wd43M0BkY3Mn9f1byhwtzVl0DiWgWdnf5ZWq1Zy700C9iVPAXTeXHx8bejZHN5nlXyPW
         beFHIUeOJy9beQaCsxb2ecmC+FXwoV9U62T/jOr+lf0LBWwRSi/EXvh8M0Wg2btJcZ1b
         cyGUipcIn4rdV+U0lJDsvB7pLyCAEcl65m5RS3mXYYr3JFM5qWIUdllBgmB/LCKvH8ne
         rdjA==
X-Gm-Message-State: APjAAAWq4XeGoU2o+gV7OqzArnfr7X6xEpVpNwsqtA2Rd4wCR1EtTC9D
        z5iM/qCRPOueqVDTQ/dqmzVMBCn2F0s=
X-Google-Smtp-Source: APXvYqwvOv/XOoRBvo8y7kKAJIk2GyFGaAEMvDhu7aoJsq8UakjEhkyVpDtq8hhrpWkCtX7oCkcJuw==
X-Received: by 2002:a0c:ee86:: with SMTP id u6mr37464574qvr.48.1571152891451;
        Tue, 15 Oct 2019 08:21:31 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id w73sm10383222qkb.111.2019.10.15.08.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 08:21:30 -0700 (PDT)
Date:   Tue, 15 Oct 2019 11:21:29 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015152129.GA11491@chatter.i7.local>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
        Steven Rostedt <rostedt@goodmis.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <20191014205658.GG5564@mit.edu>
 <20191015083741.1d0731e5@gandalf.local.home>
 <20191015133526.GC7456@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20191015133526.GC7456@mit.edu>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 15, 2019 at 09:35:27AM -0400, Theodore Y. Ts'o wrote:
>On Tue, Oct 15, 2019 at 08:37:41AM -0400, Steven Rostedt wrote:
>> Now, if we had a way to send and receive upstream patches via a web
>> site, that would actually make things easier.
>
>Alas, for those corporations who choose to enable DMARC in hard-fail
>mode (which includes google.com BTW, although thankfully, not
>gmail.com) sending (from DMARC's perspective, "forging") e-mail from
>someone at that particular domain won't work unless it comes from an
>authorized e-mail server.

This is not a huge deal for web services mailing patches, because they 
just need to specify the `From:` header in the body of the patch. From 
`man git-am`:

  "From: " and "Subject: " lines starting the body override the 
  respective commit author name and title values taken from the headers.

So, a web service emailing patches can have:

  From jdoe@webserviceaddr.example.org
  From: J.Doe <jdoe@webserviceaddr.example.org>
  Reply-to: J.Doe <jdoe@corpaddress.example.com>
  Cc: jdoe@corpaddress.example.com
  Subject: [PATCH] Fix foo in bar

  From: J.Doe <jdoe@corpaddress.example.com>

  Signed-off-by: J.Doe <jdoe@corpaddress.example.com>
  ---

This *should* be kosher with legal requirements in most companies:

- the email traverses the corporate server when the cc is received, so 
  there is a log of it in their legally required auto-cc inbox
- all replies will be sent to the corporate server
- when the patch is applied, the commit will be properly listing the 
  corporate address

>Of course, we do have a workaround for that, which is to use a
>kernel.org address.

Only a very small subset of people have these, and it may still be not 
allowed by individual company's legal departments even when this is 
available.

-K
