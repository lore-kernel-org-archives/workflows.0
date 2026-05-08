Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4E12F12DA
	for <workflows@vger.kernel.org>; Fri,  8 May 2026 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778255677; cv=none; b=UHQAm38FwyhlbtGHyF9zdAVE7wEi7hyfh0D1HgzdwrYC3EUp8WYbjDBJEvTZz+am4BBxwQs8eUFL3u8bUfpU0xF4kAQutPJMUUQt/3ndvCIzprJVp253Nv3AzDwqPAvQic9V+igYeMJRTnGL+Y7M+eSnR/aIxN+9pQVz0kEmtMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778255677; c=relaxed/simple;
	bh=xqjFCKxo9GlwV4Nlbf7hysJme63ceqasB1C1cXyhfjs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OEuL2x3mQlLTcMhBknpubF1o2TxetOHuFCsODIJX+nhpdMM2wCoyk6XdkOMlLhelm2qCgProQap0yGpcg7ckUVC8Xgw9RUN1wA/YW2hsuHhyuU94jc0kaaWYzaMd/exf36/VG2tR/lVtlzIJ9DYEemJ9ua4Do3PQmg1EneVit+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=EZCh6s1s; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="EZCh6s1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1778255675;
 bh=qTW5ZtXyLK7XVVOGNmC+9qmwi2VRMSn954QZkVeKzG8=;
 b=EZCh6s1s+wcLi3qF65TN5vgUi9exHjYz42rkrX9pAmt3WMaeMst7oaIT5SXER/LlGg/1qSt6w
 4F++2YddGS/TaTQSoUrFFRZpt0imsNJGHxvpjkTbdfbKc/9KRMw2UcZIbMkuaNZIZ6lRthFPqEF
 XAl70Dlp+aHDreT0pHStTiqmtbE6zUVzs3cBVj1mmxzM6B3r8uzWY2W3+1SkF/rsm6D0SOkkvrH
 l0eHFTBDytLEYyoyNcIzMasArQ/A7aomg1k18YFZB/mVxilj3TPJFAEcPeiFttG0eX/LPP5QBFI
 Cqr4bMBEKqdOh3McJOjB5tkldPIk+V4X62TWtYaSBxBQ==
X-Forward-Email-ID: 69fe07398bef7135f4b4757a
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.7.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Fri, 08 May 2026 11:54:32 -0400
Message-Id: <DIDF0Y3YTGL4.31WQZEPS1JOQW@ubuntu.com>
Cc: "Willy Tarreau" <w@1wt.eu>, <leon@kernel.org>, <security@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is
 and is not a security bug
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Greg KH" <greg@kroah.com>, "Linus Torvalds"
 <torvalds@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-3-w@1wt.eu>
 <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
 <2026050801-semifinal-expulsion-9af6@gregkh>
In-Reply-To: <2026050801-semifinal-expulsion-9af6@gregkh>

On Fri May 8, 2026 at 11:35 AM EDT, Greg KH wrote:
> On Wed, May 06, 2026 at 08:46:07AM -0700, Linus Torvalds wrote:
>> [ Coming back to this after a week of trying to clean up the disaster
>> that is my inbox after the merge window ]
>>=20
>> On Sun, 3 May 2026 at 04:35, Willy Tarreau <w@1wt.eu> wrote:
>> >
>> > The use of automated tools to find bugs in random locations of the ker=
nel
>> > induces a raise of security reports even if most of them should just b=
e
>> > reported as regular bugs. This patch is an attempt at drawing a line
>> > between what qualifies as a security bug and what does not, hoping to
>> > improve the situation and ease decision on the reporter's side.
>>=20
>> I actually think we may want to go further than this.
>>=20
>> I think we should simply make it a rule that "a 'security' bug that is
>> found by AI is public".

Whether my opinion is cared about or not, I feel it should be put in here:

Yes, *in theory* the bug is public. Anyone can find it. But just like bugs
sitting in open source code repositories, anyone can look for if it they tr=
y.

The only difference is that a LLM is making it more apparent and noticable
to people, if you ask it to.

The choice to then decide "therefore we can disclose it immediately", in my
opinion, is not great. Because then you are bringing attention to a bug tha=
t
nobody, or at most, relatively few people knew about (even in small circles=
)
to a broader audience.

Take Dirty Frag - even though the embargo is said to have been broken, and
all parties agreed to release the disclosure, it was put on GitHub. Of cour=
se,
information that is public, is public. But putting it on GitHub and then
buying the domain dirtyfrag.io makes it easy to bring attention to the bug
that was disclosed **with no patch or CVE.**

Even if the mitigation is "just disable the module", I still think that by
giving up the embargo entirely, we are creating more attention, and more
opportunity for exploitation. Even if it's a PoC and not an exploit for
malicious purposes.


>>=20
>> Now, I may be influenced by that "my inbox is a disaster during the
>> merge window" thing, but I do think this is pretty fundamental: if
>> somebody finds a bug with more or less standard AI tools (ie we're not
>> talking magical special hardware and nation-state level efforts), then
>> that bug pretty much by definition IS NOT SECRET.
>

Yes. I agree. But in theory that person did not need to use AI to find the
bug, so by that logic, the bug was already known about.

> After the past 2 weeks, and the past 2 months, I am going to violently
> agree with you here.  We've seen so many "duplicate" bug reports it's
> not funny.  All of the modern LLMs are feeding the output back into the
> model for future runs, which makes the data totally public.  Even if
> not, the output is being monitored by external companies at the very
> least.
>

I think that's more "unresponsible disclosure" - maybe there is some way
that LLM emails can be filtered?

And again, yes, the data is being trained. But **you have to look for it.**=
.
It is still a needle in a haystack, but it's not a black hole absorbing
said haystack.

>> So why should be consider it special and have it be on the security list=
?
>
> I don't think we should anymore.
>
> Yes, having a full reproducer in public is not good, but the general
> "this is a bug" comments we should start redirecting to public lists
> more.  That's the only way we are going to handle this influx as our
> "normal" bug workflow works very well, especially when it comes with a
> fix, as these LLM tools can provide very easily.
>

Could this at least be temporary? There are only a finite number of bugs
that can exist in a codebase.

-Josh
