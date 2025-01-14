Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA56A1FAC5C
	for <workflows@vger.kernel.org>; Tue, 14 Jan 2025 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879368; cv=none; b=FKULrfHfEZmB8aPece1DP1jYHq4O6tmeWLpujd7QylKhc2kEUNIFCvp/N6kWj5V0TGl9iRgkvQ3llReL+tppIiTrHzyAxu5TyaHJXKewe2dKSFvWC+g6D3XoPAAn1mmlk88/C5DMEm0AG165VoG6dkefMPrfbbsmqUFA/+ztYoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879368; c=relaxed/simple;
	bh=tuMFrZ0XheriuHvBb6rI4HWUALQXLkUjBZxp1PsrpfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNcEe3QfNZYq4bq5uQ9cnMvsqfFgiI7y9EKy+juyWp5PwVxJM1jKyDzM9KX6xJyIf/OwU1pqPl3q9jJLU9JkSHFXkcn3bzvYsr2gviZmqx39LfCs2PMb976NhgzKM6eMpF/eUvdXnCy/sUmQyphCbiJ7fhEjfRMqTy7f7bWHoA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qPMBfzS9; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qPMBfzS9"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467abce2ef9so306131cf.0
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2025 10:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736879366; x=1737484166; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fP2FYxg01zbB7JAkLy3PIFCTCmrP5vskUsFkaYq9Vcw=;
        b=qPMBfzS9qPe7IrZqlg1wkIDt+gw4YdE+9i0eLexKHkWlgO+O/x9qRWzRgewPUkUFPC
         E8Cz7wrn0ejW4GgrKqSnl9BQWaQbN6W1S5Zpxuc7U6/4P3ohTwvePBtuFnEQWI6Q7cFj
         yMGn6m+6+afiYGHQbivVguxhwwc4JcenK2vbz81ZWeHZzy0SD32NBpNtJYyUTkdrQNOz
         a0oQM3XZd+HbCER0U3hB5Rm5SIM6GSs+8TY/bJBRhqkTJ4YiV+85GMDuWnJpZovCIxSn
         vLXH8j1v1Fyg6y8f+rJIFGXRru3z7DHNOdPOI8xgtA2GkulH1FU63KkrBX5e+jjm8PMf
         35Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736879366; x=1737484166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fP2FYxg01zbB7JAkLy3PIFCTCmrP5vskUsFkaYq9Vcw=;
        b=v5PIMizjY5dsVfUNYdjAPdFuepDcZa/l8TI2cwigOptEWgx4IKrcScSCgUp49cu+6D
         ObJ48gZzxde8cPIqMk62IBP/tEBD24SBht8QoSRG17r8H0Z9c5AqE6lvTa7Bv83x/7F7
         LePUg1jqUiaBhwGlpQLoCCtxZrmpHS3RkgMatd638eVxA9kT+f47YqJdbHRgO0UN3+AJ
         ACcSGo4ELuXS9ne9jQGWkuh6MjzY0Fx6meNKkDhzXFfO5ZomlE4kYe12AWfDs7uCtlsK
         rks/W/PqaTlg0Pul5bxHtyo+MJk8sQpkBjTlAGFkiT29OsvFiqgqHscbbjjQo35M/Bvx
         daxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3MbdTvoewh5spK5TVe44F1JTVXYYbOs9OSdbjKJP96Nze+aas7IMrwIvdFfrbggbvyuDD6d3b0qs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTIe/PS62XQXN8olDIF2aa5OpEM7ki8eYd03QdYxT2cwsXwhF5
	S4vcyeNO3Xx9QUHOx2kMQ64vuYATFITOhLC8mGvriFG8X9oAA9NJWba3Yqx3XlKa48FBR4flsuk
	lIbx6sii0H737bfnh2O38jx6VyCup9zYid0c+
X-Gm-Gg: ASbGncuZkH/K8eBgYd1fvL+Ta5niwRTLF19CouhR6dGT+S0go8BUelM766OzETb6Rzr
	mvblCL2zcSzeqkFLgS1Nm6H0VzFSFEdFlSaNiI8SuZ+/GOughq0KySoJ1jT1ruUB71rI=
X-Google-Smtp-Source: AGHT+IF6NbO+AjTf/FCy0lNcrVASXR+PtHw3Tx7ZbiEj0GAJM4vMrvUn6FzPIOJBqhMJvAfBjAbYHe/EJMBcfXkqzzs=
X-Received: by 2002:a05:622a:1450:b0:46c:791f:bf46 with SMTP id
 d75a77b69052e-46dea92686bmr3258841cf.19.1736879365440; Tue, 14 Jan 2025
 10:29:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
 <20250113-checkpatch-ignore-v1-1-63a7a740f568@google.com> <5abiddu5zgxdmotauxnohnk25zyzd3cbjlfgskejk5ta7arzk2@pjpofoy7pcce>
 <CA+i-1C1WF1cSvcNABGRbg34_aaOnSoVoDNBR357q8rrGk52OPQ@mail.gmail.com> <20250114-tapir-of-splendid-leadership-ad115e@lemur>
In-Reply-To: <20250114-tapir-of-splendid-leadership-ad115e@lemur>
From: Brendan Jackman <jackmanb@google.com>
Date: Tue, 14 Jan 2025 19:29:14 +0100
X-Gm-Features: AbW1kva5sW-rXTnemQTnnc5Xt-0oQc5VCVpNEfJYacYH51C_uSiSrZfr7NbQZS0
Message-ID: <CA+i-1C2OrLDvp_xiomc_B96vZu8G8KRrg7KBHATz2y7KMO8UsA@mail.gmail.com>
Subject: Re: [PATCH 1/2] checkpatch: Add support for Checkpatch-ignore patch footer
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2025 at 17:04, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Tue, Jan 14, 2025 at 03:25:41PM +0100, Brendan Jackman wrote:
> > <konstantin@linuxfoundation.org> wrote:
> > > Do we really want this to become part of the permanent commit message? I'm
> > > pretty sure this won't go over well with many.
> >
> > Why not?
>
> Tweaks aimed at checkpatch are only useful during the code review stage, so
> once that code is accepted upstream, they become wholly irrelevant. A
> checkpatch trailer in the permanent commit record serves no purpose, not even
> a historical one.

Yeah that's a good argument for them being unnecessary. It's not clear
why them persisting beyond their useful lifetime would be a problem
though. Any given reader of a commit message is already very likely to
see tags they don't care about in that moment, is that something
people really complain about?

> At best, utility trailers like that need to go into the basement of the patch,
> not into the commit message.

If people do really object to them being in the commit message, I like
this as a backup. It looks like the UX for git would be like:

  git notes --ref checkpatch-ignore append -m "EMAIL_SUBJECT"

Then if you set --notes=checkpatch-ignore in your format-patch command
it comes out like this after the "---":

  Notes (checkpatch-ignore):
      EMAIL_SUBJECT

Downsides?

1. More Perl. But, OK, we have an existence proof that writing Perl is possible.

2. Doesn't seem this can be imported by 'git am'. But, I don't think
that's necessary.

3. That 'git notes' command is a bit unwieldy. But, whatever.

4. With the default Git config, if you rebase your commits you lose the setting.

Point 4 does matter IMO, but it can at least be worked around with:

  git config set notes.rewriteRef "refs/notes/**"
