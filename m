Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9EA3DB87;
	Tue,  9 Jan 2024 21:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ck7qHMbe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FD1C433F1;
	Tue,  9 Jan 2024 21:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704836843;
	bh=TSDpF1S8lQAwZw/lVeytxTPjeCJbcaeqA8hGl4RvNpg=;
	h=Date:From:To:Subject:From;
	b=ck7qHMbeWEPqkpBp13uskAiTzYpWH/CJLZ46IaJ9z/DAtmO+w1hxLADCQ7yA5Z8mp
	 uNpXF/bfFdNwxwkad8Ij+UsKyDneA4BdA6NP0dOY5zGeB823DtItPAVXX3tXvluWz3
	 uyG/4PpKT4TnDSaI1Nr0e+ykw6AexMClbfA9nPRI=
Date: Tue, 9 Jan 2024 16:47:22 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: robh@kernel.org, users@linux.kernel.org, workflows@vger.kernel.org
Subject: PSA: nullmailer should be avoided
Message-ID: <20240109-alluring-fanatic-manul-cfa5d2@lemur>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

I know some of you use nullmailer for sending outgoing mail, but it *really*
must be avoided, as the messages it sends are not RFC-2822 compliant. Per that
RFC, header lines MUST NOT be longer than 998 characters in length, which is
not something nullmailer appears to be paying any attention to.

Some mailservers will outright reject messages with lines exceeding 998
characters (Exim), and some will force-insert <CR><LF><SPACE> at exactly
character 998, regardless of what that does to the header:

https://lore.kernel.org/linux-kernel/20240109171807.GA2783042-robh@kernel.org/raw

You will notice, that the enforced line-break cuts across the email address:

       Cc: [...] Sergey Shtylyov <s.shtyl
        yov@omp.ru>

A message with such header *may* get delivered, or it may get rejected due to
malformed headers (e.g. Exim does that by default). Anyone then attempting to
reply to such message will likely have trouble as well.

Unfortunately, nullmailer appears to always re-parse To/Cc headers, so even if
the original email properly wrapped the recipients headers before it was fed
to nullmailer, everything will then just be concatenated into one long line:

https://github.com/bruceg/nullmailer/blob/master/src/inject.cc#L384

I'll open an issue with nullmailer about this, but the project doesn't appear
very alive, so your best bet is to switch to msmtp. It has
msmtp-{enqueue,listqueue,runqueue} commands that will do everything nullmailer
can do and won't break your mail.

-K
