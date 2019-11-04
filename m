Return-Path: <SRS0=lUaU=Y4=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A1DCA9ECF
	for <workflows@archiver.kernel.org>; Mon,  4 Nov 2019 14:49:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B349A21D7F
	for <workflows@archiver.kernel.org>; Mon,  4 Nov 2019 14:49:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbfKDOtx (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 4 Nov 2019 09:49:53 -0500
Received: from mga04.intel.com ([192.55.52.120]:29846 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727838AbfKDOtx (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 4 Nov 2019 09:49:53 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 06:49:52 -0800
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; 
   d="scan'208";a="195475235"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 06:49:49 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     Dmitry Vyukov <dvyukov@google.com>,
        "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, Eric Wong <e@80x24.org>,
        workflows@vger.kernel.org
Subject: Re: patch attachments still unwelcome?
In-Reply-To: <CACT4Y+atKXTqfjSCjzhf_P0MT+fQT-vP90nfct__BaiF2qiK0A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191101022746.GA25491@dcvr> <20191101090456.GD2671695@kroah.com> <20191104131310.GE28764@mit.edu> <CACT4Y+atKXTqfjSCjzhf_P0MT+fQT-vP90nfct__BaiF2qiK0A@mail.gmail.com>
Date:   Mon, 04 Nov 2019 16:49:46 +0200
Message-ID: <87sgn37l2t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

--=-=-=
Content-Type: text/plain

On Mon, 04 Nov 2019, Dmitry Vyukov <dvyukov@google.com> wrote:
> On Mon, Nov 4, 2019 at 2:13 PM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>>
>> On Fri, Nov 01, 2019 at 10:04:56AM +0100, Greg KH wrote:
>> > > So the documentation in the kernel advising against sending
>> > > patch attachments seems hypocritical.  Changing the kernel docs
>> > > allow patch attachments could be a good start to making life
>> > > easier for contributors without SMTP or IMAP access.
>> >
>> > It's not hypocritical, as lots of email clients still get this wrong and
>> > make responding to attachments almost impossible.  Many do get it right,
>> > but trying to document the differences here is quite difficult (I tried
>> > once, gave up as it was a mess).
>> >
>> > > Are many MUAs still incapable of handling them?
>> > > mutt shows text patches inline, at least.
>> >
>> > For most MUAs that send them, yes, but not for all.  I know of at least
>> > 2 that send text attachments in formats that mutt will not show it
>> > inline, nor allow responding to them properly.  MacOS Mail is one easy
>> > example to point to as getting this totally wrong.
>> >
>> > So, if you know what you are doing, yes, this is fine, but it's still a
>> > good idea to say "please do not do this" to make it easier for people
>> > just starting out.
>>
>> Perhaps we should explicitly explain this and then include a white
>> list of MUA's that can send text attachments safely/correctly?  (e.g.,
>> if you are using the following MUA's, using text attachments are OK;
>> if you are using the following MUA's, it will definitely NOT work;
>> with all others, proceed with caution.)
>
>
> One thing that wasn't clear to me when I implemented syzbot is that
> some people see attachments inline. syzbot included whole kernel
> config and 1MB of logs as attachments, I assumed that other people see
> them as, well, attachments. So that may be worth documenting as well.
> Though, I did not know that document exists as well, so it would not
> help me...

Typically you'd have a multipart/mixed MIME message with several parts
of various Content-Types. In this case presumably text/plain, but
text/x-diff is not out of the question for patches. Also seen a lot of
application/octet-stream for logs.

You can give a *hint* to the recipient MUA on how to interpret each part
by setting Content-Disposition: attachment or inline. Bottom line,
whether you can control that in your MUA, and whether the recipient MUA
actually respects that is anyone's guess.

For fun, this multipart message contains three parts, the one you're
reading, and two additional parts, one of which should be inline and the
other one an attachment.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

--=-=-=
Content-Type: text/plain
Content-Disposition: inline; filename=inline

This is supposed to be inline.

--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=attachment

This is supposed to be an attachment.

--=-=-=--
