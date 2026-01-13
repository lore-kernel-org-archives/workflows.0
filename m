Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44242FDC35
	for <workflows@vger.kernel.org>; Tue, 13 Jan 2026 21:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338220; cv=none; b=O3JZXv+4sz8HS04rHtuCWz3cedt7zzyjmFpgReMSsTTe4BrwFBE48K7Hx40iEspixhKk7ZS0j2/BXkb6O4DBX1Y09LnGffSyx4wdJi+AzU253P1y0va3uc/pnHWJ++UYsu3wykFGeaYx/ps7cCgEe7FLSnioY6WPVWFPSUWsHUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338220; c=relaxed/simple;
	bh=IrPeUxe6Cqy6zzxed5sNg7QDoTLEW3bz2ePDNFWeWsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLbnenCs01/S94UzLRuNobzOlYjgZ1sXAUJ1Sr4sYq9qOe9Sx3t3IRd8Of0cM1t6uPTvRhvHKZ7KcBOx9RnVyJtBB8W97G+k6h6TqGmgKiXsXOzlkTAuglsW/+V0AQ1DrJh3LWPe9E/1rQukbpwyAGLhU5yaI205PWKx4BVlmV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuehTzr5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuehTzr5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so987675e9.0
        for <workflows@vger.kernel.org>; Tue, 13 Jan 2026 13:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768338217; x=1768943017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrPeUxe6Cqy6zzxed5sNg7QDoTLEW3bz2ePDNFWeWsw=;
        b=EuehTzr5Z7eeWraAox3re9Rc6gKp4FwR4kN7E4rq3oEL5slN4mJATli+IIyJtR1tZc
         xILEv71TT8h0PQE2JWftDmsrce9LG8m3Lths/nbUSZGomsaaQaCLPX0vkPcIdo9ZQMP/
         tgwVB4v3Vzsb7nrSiVaqOkBwKy+DMgY/QhYeFpfKMAX7g74E4WSWEeA89MkgsMquHXi9
         5+s0er0uAT949jOkfIw2VOMU/a2yzU7p17ZMc9kSV+8he+7Kkr3qYiXcE+5BguM0APg7
         It4NFZdkwGOxw5l6nhr4rBpAGp8zvJT52nwk/298NPn4vh3PR4zclxeLWY6cGNK34P73
         v5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768338217; x=1768943017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IrPeUxe6Cqy6zzxed5sNg7QDoTLEW3bz2ePDNFWeWsw=;
        b=OYQ9wm5lxYjYDO4PQrooJvRZVUwyt7n0VtUX4R0/LTOveyH1IkBvnBO9H+hHX7JfFL
         Ndp5CHTDnI7AL8n83gO2KrHWuZJf5CRpkxVDGz6lBTIijDnJXRUs6k8r/RgZSB6SnF7Z
         QIDKFR8SqfGpDMoRUS93x9YxvLjaux82aZlMdf3kJr+g6QI5C7R7t5Tl9ubdvombSouv
         puLD/uSUaLGv6R03qbxK88dCsOX03B9sAoOMy6aNmk0nzWhpirpkx7CujO2/BKUVpxgL
         ypqEiilVbuAvfvaWbji5aDofDMwKrvN4QlXcR6gmjH+ZVeOZC6trbPLhxCG/wqAzvkGI
         czKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0s/HStcqT2olAr/BL1MZTgQEKfuG2ezs+0VQ4m//nfW3hKdN2Ct2Z4cr/mgR1cYUOlCsAgv+gHOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBPzUxNyfcGar35g1lR9zDHZckHrS+mQUWAxq2F7iwGMN0YP9b
	PE1YUf6qGX0tRfwhMJ8TITkRfyIjAAEM3YzW1xo2+flqplMdYvX9SgqJSvac2Vx4zgzxWkx5iD8
	rG6bLB8PoFVQJ74q17kfoml4IgucTpuM=
X-Gm-Gg: AY/fxX5H4xGIajS1YUUhC86bB5vWXXeXfppohFbegBKFiXet5J6sLkEzD9D+6iHcflG
	5zkHvGAkUT1uiew/LB0ahHwMFSyZL35WN1zy7TkUs7xtfVsdKgEmRLC2yYXmWvP2SML3Um+SSpq
	yYprb+fRKwfra8JgW/0OGZjrqA0bVXkw3Xk+Y/gR2tQDJoxw7NpwC/bi3csHs+OyTrlaqZ2Wdsm
	vpxW32+DP5Swy+t3vtdk56Ucu1fs0sY8msUwiPAYSamyl1mT9vhXXxcwNaY9hyr9znbBkpMApRg
	TCvjMQNx+jlayByF7HgTCPraFsjpt9oO7p2YGiM=
X-Received: by 2002:a05:600c:8b0d:b0:45d:5c71:769d with SMTP id
 5b1f17b1804b1-47ee3782a45mr4166605e9.8.1768338216903; Tue, 13 Jan 2026
 13:03:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
 <aWXYi35pu9IHf2eE@stanley.mountain> <69668cfc63bb1_875d1004@dwillia2-mobl4.notmuch>
 <aWaSQsl8h2wnBjzj@laps> <69669404e2bf_875d10028@dwillia2-mobl4.notmuch>
In-Reply-To: <69669404e2bf_875d10028@dwillia2-mobl4.notmuch>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 13 Jan 2026 13:03:25 -0800
X-Gm-Features: AZwV_QixSQTSA7Fud7ctoWLfr-ehOBloZ5T35wkQapYGHDFQLqI0jXvcZPR12QM
Message-ID: <CAADnVQJG-xn4dURVDt4dUVriHeFkLXnUPxA46XFOTBSi-HRGyA@mail.gmail.com>
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for tool-generated content
To: Dan Williams <dan.j.williams@intel.com>
Cc: Sasha Levin <sashal@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Simon Glass <simon.glass@canonical.com>, 
	NeilBrown <neilb@ownmail.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>, 
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 10:51=E2=80=AFAM <dan.j.williams@intel.com> wrote:
>
> Sasha Levin wrote:
> [..]
> > With a rule like the above, 1700+ contributors would have not been able=
 to send
> > their patch in.
>
> Good point, I am not suggesting a Reviewed-by hurdle, but can see it
> reading that way. I expect that there will always be a significant class
> of contributions that will never need author trust to be accepted. Yes,
> would need to be careful not to destroy that wellspring of new
> contributors.

You brought up an excellent point and I think it should be documented
in submitting-patches.rst:
A developer "should be able to demonstrate the
ability to substantively review a contribution of similar complexity
before expecting the kernel community to engage in earnest".

In bpf and netdev communities we ask developers to participate
in code reviews and publish metrics:
https://lore.kernel.org/bpf/?q=3Ds%3A%22bpf+development+stats%22

A bit gamified rankings, but the message is clear:
want to land patches faster? participate in code reviews!
It reduces maintainers load and demonstrates that code-reviewing
developers actually understand the code, builds maintainer's trust.
